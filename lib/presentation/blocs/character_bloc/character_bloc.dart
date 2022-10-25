import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honkai_lab/domain/entities/character.dart';
import 'package:honkai_lab/domain/usecases/get_character.dart';

import '../../../common/errors/failure.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final GetCharacter getCharacter;
  CharacterBloc({required this.getCharacter}) : super(EmptyCharacter()) {
    on<FetchCharacter>(
      (event, emit) async {
        emit(
          LoadingCharacter(),
        );
        final failureOrCharacter = await getCharacter("character", event.value);

        failureOrCharacter.fold(
          (failure) => emit(
            ErrorCharacter(
              errorMessage: _mapFailureOrMessage(failure),
            ),
          ),
          (characterBanner) => emit(
            LoadedCharacter(characters: characterBanner),
          ),
        );
      },
    );
    on<SearchCharacter>(
      (event, emit) async {
        final state = this.state;
        if (state is LoadedCharacter) {
          emit(
            LoadingCharacter(),
          );
          final failureOrCharacter =
              await getCharacter("character", event.value);
          failureOrCharacter.fold(
            (failure) => emit(
              ErrorCharacter(
                errorMessage: _mapFailureOrMessage(failure),
              ),
            ),
            (characterBanner) => emit(
              LoadedCharacter(characters: characterBanner),
            ),
          );
        }
      },
    );

    on<SortAscending>(
      (event, emit) {
        final state = this.state;
        if (state is LoadedCharacter) {
          if (event.value == "Sort By A-Z") {
            state.characters.sort(
              (a, b) => a.nameCharacter.compareTo(b.nameCharacter),
            );
          }
        }
      },
    );
    on<SortDescending>(
      (event, emit) {
        final state = this.state;
        if (state is LoadedCharacter) {
          if (event.value == "Sort By Z-A") {
            state.characters.sort(
              (a, b) => b.nameCharacter.compareTo(a.nameCharacter),
            );
          }
        }
      },
    );
  }

  String _mapFailureOrMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'ServerFailure';
      default:
        return 'Unexpected Error';
    }
  }
}

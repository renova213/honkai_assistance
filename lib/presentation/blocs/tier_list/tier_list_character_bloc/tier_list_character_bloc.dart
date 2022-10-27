import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honkai_lab/domain/entities/character.dart';
import 'package:honkai_lab/domain/usecases/get_character.dart';

import '../../../../common/errors/failure.dart';

part 'tier_list_character_event.dart';
part 'tier_list_character_state.dart';

class TierListCharacterBloc
    extends Bloc<TierListCharacterEvent, TierListCharacterState> {
  final GetCharacter getCharacter;
  TierListCharacterBloc({required this.getCharacter})
      : super(EmptyTierListCharacter()) {
    on<TierListCharacterEvent>(
      (event, emit) async {
        emit(
          LoadingTierListCharacter(),
        );
        final failureOrTierListCharacter = await getCharacter("character", "");

        failureOrTierListCharacter.fold(
          (failure) => emit(
            ErrorTierListCharacter(
              errorMessage: _mapFailureOrMessage(failure),
            ),
          ),
          (tierListCharacter) {
            List<Character> tierExDpsCharacters = [];
            List<Character> tierSDpsCharacter = [];
            List<Character> tierADpsCharacter = [];
            List<Character> tierBDpsCharacter = [];
            List<Character> tierExSupportCharacters = [];
            List<Character> tierSSupportCharacters = [];
            List<Character> tierASupportCharacters = [];

            for (var i in tierListCharacter) {
              if (i.tier == "ex" &&
                  !tierExDpsCharacters.contains(i) &&
                  i.role == "dps") {
                tierExDpsCharacters.add(i);
              }
              if (i.tier == "s" &&
                  !tierSDpsCharacter.contains(i) &&
                  i.role == "dps") {
                tierSDpsCharacter.add(i);
              }
              if (i.tier == "a" &&
                  !tierADpsCharacter.contains(i) &&
                  i.role == "dps") {
                tierADpsCharacter.add(i);
              }
              if (i.tier == "b" &&
                  !tierBDpsCharacter.contains(i) &&
                  i.role == "dps") {
                tierBDpsCharacter.add(i);
              }

              if (i.role == "support" &&
                  i.tier == "ex" &&
                  !tierExSupportCharacters.contains(i)) {
                tierExSupportCharacters.add(i);
              }

              if (i.role == "support" &&
                  i.tier == "s" &&
                  !tierSSupportCharacters.contains(i)) {
                tierSSupportCharacters.add(i);
              }
              if (i.role == "support" &&
                  i.tier == "a" &&
                  !tierASupportCharacters.contains(i)) {
                tierASupportCharacters.add(i);
              }
            }
            emit(
              LoadedTierListCharacter(
                  tierExDpsCharacters: tierExDpsCharacters,
                  tierSDpsCharacter: tierSDpsCharacter,
                  tierADpsCharacter: tierADpsCharacter,
                  tierBDpsCharacter: tierBDpsCharacter,
                  tierExSupportCharacters: tierExSupportCharacters,
                  tierSSupportCharacters: tierSSupportCharacters,
                  tierASupportCharacters: tierASupportCharacters),
            );
          },
        );
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

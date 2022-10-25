import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:honkai_lab/domain/entities/banner_character.dart';
import 'package:honkai_lab/domain/usecases/get_banner_character.dart';

import '../../../../common/errors/failure.dart';

part 'banner_character_event.dart';
part 'banner_character_state.dart';

class BannerCharacterBloc
    extends Bloc<BannerCharacterEvent, BannerCharacterState> {
  final GetBannerCharacter getBannerCharacter;
  BannerCharacterBloc({required this.getBannerCharacter})
      : super(EmptyBannerCharacter()) {
    on<FetchBannerCharacter>(
      (event, emit) async {
        emit(
          LoadingBannerCharacter(),
        );
        final failureOrBannerCharacter =
            await getBannerCharacter("banner_character");

        failureOrBannerCharacter.fold(
          (failure) => emit(
            ErrorBannerCharacter(
              errorMessage: _mapFailureOrMessage(failure),
            ),
          ),
          (characterBanner) => emit(
            LoadedBannerCharacter(characterBanners: characterBanner),
          ),
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

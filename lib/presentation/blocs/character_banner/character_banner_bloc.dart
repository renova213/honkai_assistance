import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:honkai_assistance/domain/usecases/get_character_banner.dart';

import '../../../domain/entities/character_banner_entity.dart';

part 'character_banner_event.dart';
part 'character_banner_state.dart';

class CharacterBannerBloc
    extends Bloc<CharacterBannerEvent, CharacterBannerState> {
  final GetCharacterBanner getCharacterBanner;
  CharacterBannerBloc({required this.getCharacterBanner})
      : super(EmptyCharacterBannerState()) {
    on<GetCharacterBannerEvent>((event, emit) async {
      emit(LoadingCharacterBannerState());

      final failureOrCharacterBanner = await getCharacterBanner.call();

      failureOrCharacterBanner.fold(
        (failure) => emit(ErrorCharacterBannerState(message: failure.message)),
        (characterBanners) => emit(
            LoadedCharacterBannerState(characterBanners: characterBanners)),
      );
    });
  }
}

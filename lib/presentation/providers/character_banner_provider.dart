import 'package:flutter/foundation.dart';
import 'package:honkai_assistance/domain/entities/character_banner_entity.dart';
import 'package:honkai_assistance/domain/usecases/get_character_banner.dart';

import '../../common/util/enum_state.dart';

class CharacterBannerProvider extends ChangeNotifier {
  final GetCharacterBanner getCharacterBanner;
  CharacterBannerProvider({required this.getCharacterBanner});

  List<CharacterBannerEntity> _characterBanners = [];
  AppState _appState = AppState.loading;
  String _failureMessage = "";

  List<CharacterBannerEntity> get characterBanners => _characterBanners;
  AppState get appstate => _appState;
  String get failureMessage => _failureMessage;

  Future<void> getCharacterBanners() async {
    changeAppState(AppState.loading);

    final failureOrCharacterBanner = await getCharacterBanner.call();

    failureOrCharacterBanner.fold(
      (failure) {
        _failureMessage = failure.message;
        changeAppState(AppState.failed);
      },
      (characterBanners) {
        _characterBanners = characterBanners;
        changeAppState(AppState.loaded);
      },
    );
  }

  changeAppState(AppState state) {
    _appState = state;
    notifyListeners();
  }
}

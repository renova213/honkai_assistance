import 'package:flutter/foundation.dart';
import 'package:honkai_assistance/domain/entities/guide_entity.dart';

import '../../../common/util/enum_state.dart';
import '../../../domain/usecases/remote/get_general_guide.dart';

class GeneralGuideProvider extends ChangeNotifier {
  final GetGeneralGuide getGeneralGuide;
  GeneralGuideProvider({required this.getGeneralGuide});

  List<GuideEntity> _generalGuides = [];
  AppState _appState = AppState.loading;
  String _failureMessage = "";

  List<GuideEntity> get generalGuides => _generalGuides;
  AppState get appstate => _appState;
  String get failureMessage => _failureMessage;

  Future<void> getGeneralGuides() async {
    changeAppState(AppState.loading);

    final failureOrCharacterBanner = await getGeneralGuide.generalGuides();

    failureOrCharacterBanner.fold(
      (failure) {
        _failureMessage = failure.message;
        changeAppState(AppState.failed);
      },
      (generalGuides) {
        _generalGuides = generalGuides;
        changeAppState(AppState.loaded);
      },
    );
  }

  changeAppState(AppState state) {
    _appState = state;
    notifyListeners();
  }
}

import 'package:flutter/foundation.dart';
import 'package:honkai_assistance/domain/entities/guide_entity.dart';
import 'package:honkai_assistance/domain/usecases/remote/get_beginner_guide.dart';

import '../../../common/util/enum_state.dart';

class BeginnerGuideProvider extends ChangeNotifier {
  final GetBeginnerGuide getBeginnerGuide;
  BeginnerGuideProvider({required this.getBeginnerGuide});

  List<GuideEntity> _beginnerGuides = [];
  AppState _appState = AppState.loading;
  String _failureMessage = "";

  List<GuideEntity> get beginnerGuides => _beginnerGuides;
  AppState get appstate => _appState;
  String get failureMessage => _failureMessage;

  Future<void> getBeginnerGuides() async {
    changeAppState(AppState.loading);

    final failureOrCharacterBanner = await getBeginnerGuide.beginnerGuides();

    failureOrCharacterBanner.fold(
      (failure) {
        _failureMessage = failure.message;
        changeAppState(AppState.failed);
      },
      (beginnerGuides) {
        _beginnerGuides = beginnerGuides;
        changeAppState(AppState.loaded);
      },
    );
  }

  changeAppState(AppState state) {
    _appState = state;
    notifyListeners();
  }
}

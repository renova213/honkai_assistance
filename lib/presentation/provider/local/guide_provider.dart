import 'package:flutter/material.dart';
import 'package:honkai_assistance/domain/usecases/local/guide_menu_usecase.dart';

import '../../../domain/entities/guide_menu_entity.dart';

class GuideProvider extends ChangeNotifier {
  final GuideMenuUsecase guideMenuUsecase;
  GuideProvider({required this.guideMenuUsecase});

  List<GuideMenuEntity> _beginnerMenuGuide = [];
  List<GuideMenuEntity> _generalMenuGuide = [];

  List<GuideMenuEntity> get beginnerMenuGuide => _beginnerMenuGuide;
  List<GuideMenuEntity> get generalMenuGuide => _generalMenuGuide;

  void getBeginnerMenuGuide() async {
    _beginnerMenuGuide = await guideMenuUsecase.beginnerGuide();
    notifyListeners();
  }

  void getGeneralMenuGuide() async {
    _generalMenuGuide = await guideMenuUsecase.generalGuide();
    notifyListeners();
  }
}

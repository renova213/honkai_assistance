import 'package:flutter/material.dart';
import 'package:honkai_assistance/domain/entities/about_content.dart';

import '../../../domain/entities/official_link.dart';
import '../../../domain/usecases/local/about_content_usecase.dart';
import '../../../domain/usecases/local/official_link_global_usecase.dart';
import '../../../domain/usecases/local/official_link_sea_usecase.dart';

class AboutGameProvider extends ChangeNotifier {
  final AboutContentUsecase aboutContentUsecase;
  final OfficialLinkSeaUsecase officialLinkSeaUsecase;
  final OfficialLinkGlobalUsecase officialLinkGlobalUsecase;
  AboutGameProvider(
      {required this.aboutContentUsecase,
      required this.officialLinkGlobalUsecase,
      required this.officialLinkSeaUsecase});

  List<AboutContent> _aboutContents = [];
  List<OfficialLink> _officialLinksSea = [];
  List<OfficialLink> _officialLinksGlobal = [];

  List<OfficialLink> get officialLinksSea => _officialLinksSea;
  List<OfficialLink> get officialLinksGlobal => _officialLinksGlobal;
  List<AboutContent> get aboutContents => _aboutContents;

  Future<void> getAboutContent() async {
    _aboutContents = await aboutContentUsecase.call();
    notifyListeners();
  }

  Future<void> getOfficialLinkSea() async {
    _officialLinksSea = await officialLinkSeaUsecase.call();
    notifyListeners();
  }

  Future<void> getOfficialLinkGlobal() async {
    _officialLinksGlobal = await officialLinkGlobalUsecase.call();
    notifyListeners();
  }
}

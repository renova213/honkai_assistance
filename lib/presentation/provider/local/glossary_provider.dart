import 'package:flutter/material.dart';
import 'package:honkai_assistance/domain/entities/glossary.dart';
import 'package:honkai_assistance/domain/usecases/local/game_mode.dart';
import 'package:honkai_assistance/domain/usecases/local/glossary_rank.dart';
import 'package:honkai_assistance/domain/usecases/local/glossary_speciality.dart';

class GlossaryProvider extends ChangeNotifier {
  final GameMode gameMode;
  final GlossaryRank glossaryRank;
  final GlossarySpeciality glossarySpeciality;
  GlossaryProvider(
      {required this.gameMode,
      required this.glossaryRank,
      required this.glossarySpeciality});
  List<Glossary> _gameModes = [];
  List<Glossary> _glossaryRanks = [];
  List<Glossary> _glossarySpecialities = [];

  List<Glossary> get glossarySpecialities => _glossarySpecialities;
  List<Glossary> get gameModes => _gameModes;
  List<Glossary> get glossaryRanks => _glossaryRanks;

  Future<void> getGameModes() async {
    _gameModes = await gameMode.call();
    notifyListeners();
  }

  Future<void> getGlossaryRanks() async {
    _glossaryRanks = await glossaryRank.call();
    notifyListeners();
  }

  Future<void> getGlossarySpecialities() async {
    _glossarySpecialities = await glossarySpeciality.call();
    notifyListeners();
  }
}

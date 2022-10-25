import 'package:flutter/material.dart';
import 'package:honkai_lab/domain/entities/modes.dart';
import 'package:honkai_lab/domain/entities/rank_glossary.dart';

class TierListProvider extends ChangeNotifier {
  final List<String> items = ["DPS", "Support"];

  final List<Modes> _listModeGame = [
    Modes(mode: "Story Mode", explanation: "Campaign and some Event stages."),
    Modes(
        mode: "Memorial Arena",
        explanation:
            "is a game mode where Captains can face off against challenging bosses with different difficulties, the score depend on how fast boss get killed"),
    Modes(
        mode: "Exalted Abyss",
        explanation:
            "Is an Abyss mode for Lv80+ Captains. Every Abyss round consists of four stages."),
    Modes(
        mode: "Q-Singularis",
        explanation:
            "Q-Singularis breaks down into 4 layers, each containing 4 standard floors and 1 Boss floor with a special layer effect."),
  ];
  List<Modes> get listModeGame => _listModeGame;

  final List<RankGlossary> _rankGlossaries = [
    RankGlossary(tier: "ex", explanation: "Have highest score on bosses"),
    RankGlossary(
        tier: "s",
        explanation:
            "Coverage more bosses and still top scores on spesific bosses"),
    RankGlossary(
        tier: "a",
        explanation:
            "Technically still a great valk, but lost in meta due to various reasons"),
    RankGlossary(tier: "b", explanation: "Lost to meta"),
  ];
  List<RankGlossary> get rankGlossaries => _rankGlossaries;

  String _value = "DPS";
  String get value => _value;

  Color _colorBottom = Colors.red;
  Color get colorBottom => _colorBottom;

  void changeValueButton(String value) {
    _value = value;
    notifyListeners();
  }

  void changeBottomBorderColor(String element) {
    if (element == "ice") {
      _colorBottom = Colors.lightBlue;
    }

    if (element == "physical") {
      _colorBottom = Colors.orange;
    }

    if (element == "fire") {
      _colorBottom = Colors.red;
    }

    if (element == "thunder") {
      _colorBottom = Colors.purple;
    }
  }
}

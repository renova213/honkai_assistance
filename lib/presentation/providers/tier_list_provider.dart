import 'package:flutter/material.dart';
import 'package:honkai_lab/domain/entities/changelog.dart';
import 'package:honkai_lab/domain/entities/character.dart';
import 'package:honkai_lab/domain/entities/modes.dart';
import 'package:honkai_lab/domain/entities/rank_glossary.dart';
import 'package:honkai_lab/domain/usecases/get_changelog.dart';
import 'package:honkai_lab/domain/usecases/get_character.dart';

import '../../common/errors/failure.dart';
import '../../common/utils/finite_state.dart';

class TierListProvider extends ChangeNotifier {
  final GetCharacter character;
  final GetChangelog changelog;
  TierListProvider({required this.character, required this.changelog});

  final List<String> items = ["DPS", "Support"];

  MyState _myState = MyState.loading;
  MyState get myState => _myState;

  final List<Character> _tierExDpsCharacters = [];
  List<Character> get tierExDpsCharacters => _tierExDpsCharacters;

  final List<Character> _tierSDpsCharacter = [];
  List<Character> get tierSDpsCharacter => _tierSDpsCharacter;

  final List<Character> _tierADpsCharacter = [];
  List<Character> get tierADpsCharacter => _tierADpsCharacter;

  final List<Character> _tierBDpsCharacter = [];
  List<Character> get tierBDpsCharacter => _tierBDpsCharacter;

  final List<Character> _tierExSupportCharacters = [];
  List<Character> get tierExSupportCharacters => _tierExSupportCharacters;

  final List<Character> _tierSSupportCharacters = [];
  List<Character> get tierSSupportCharacters => _tierSSupportCharacters;

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

  late Changelog _changelogs;
  Changelog get changelogs => _changelogs;

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

  void fetchCharacter(String value) async {
    try {
      _myState = MyState.loading;
      notifyListeners();

      final response = await character("character", value);

      response.fold((failure) => throw _mapFailureOrMessage(failure),
          (character) {
        for (var i in character) {
          if (i.tier == "ex" &&
              !_tierExDpsCharacters.contains(i) &&
              i.role == "dps") {
            _tierExDpsCharacters.add(i);
          }
          if (i.tier == "s" &&
              !_tierSDpsCharacter.contains(i) &&
              i.role == "dps") {
            _tierSDpsCharacter.add(i);
          }
          if (i.tier == "a" &&
              !_tierADpsCharacter.contains(i) &&
              i.role == "dps") {
            _tierADpsCharacter.add(i);
          }
          if (i.tier == "b" &&
              !_tierBDpsCharacter.contains(i) &&
              i.role == "dps") {
            _tierBDpsCharacter.add(i);
          }

          if (i.role == "support" &&
              i.tier == "ex" &&
              !_tierExSupportCharacters.contains(i)) {
            _tierExSupportCharacters.add(i);
          }

          if (i.role == "support" &&
              i.tier == "s" &&
              !_tierSSupportCharacters.contains(i)) {
            _tierSSupportCharacters.add(i);
          }
        }
      });

      _myState = MyState.hasData;
      notifyListeners();
    } catch (e) {
      _myState = MyState.failed;
      notifyListeners();
    }
  }

  void fetchChangelog() async {
    try {
      _myState = MyState.loading;
      notifyListeners();

      final response = await changelog("changelog");

      response.fold((failure) => throw _mapFailureOrMessage(failure),
          (changelog) => _changelogs = changelog);

      _myState = MyState.hasData;
      notifyListeners();
    } catch (e) {
      _myState = MyState.failed;
      notifyListeners();
    }
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

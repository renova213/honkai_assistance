import 'package:flutter/material.dart';
import 'package:honkai_lab/domain/entities/character.dart';
import 'package:honkai_lab/domain/usecases/get_character.dart';

import '../../common/errors/failure.dart';
import '../../common/utils/finite_state.dart';

class TierListProvider extends ChangeNotifier {
  final GetCharacter character;
  TierListProvider({required this.character});

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

  void fetchTierExCharacter() async {
    try {
      _myState = MyState.loading;
      notifyListeners();

      final response = await character("character");

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

  String _mapFailureOrMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'ServerFailure';
      default:
        return 'Unexpected Error';
    }
  }
}

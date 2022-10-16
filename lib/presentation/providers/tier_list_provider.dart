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

  final List<Character> _tierExCharacters = [];
  List<Character> get tierExCharacters => _tierExCharacters;

  final List<Character> _tierSCharacter = [];
  List<Character> get tierSCharacter => _tierSCharacter;

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

    if (element == "quantum") {
      _colorBottom = Colors.blue;
    }

    if (element == "imaginary") {
      _colorBottom = Colors.amber;
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
          if (i.tier == "ex" && !_tierExCharacters.contains(i)) {
            _tierExCharacters.add(i);
          }
          if (i.tier == "s" && !_tierSCharacter.contains(i)) {
            _tierSCharacter.add(i);
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

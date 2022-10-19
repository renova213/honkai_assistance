import 'package:flutter/material.dart';
import 'package:honkai_lab/domain/entities/character.dart';
import 'package:honkai_lab/domain/usecases/get_character.dart';

import '../../common/errors/failure.dart';
import '../../common/utils/finite_state.dart';

class CharacterProvider extends ChangeNotifier {
  final GetCharacter character;
  CharacterProvider({required this.character});
  final List<String> _itemsDropdown = ["Sort By A-Z", "Sort By Z-A"];
  List<String> get itemsDropdown => _itemsDropdown;

  final List<String> _itemsElement = [
    "Any Element",
    "Thunder",
    "Fire",
    "Physical",
    "Ice"
  ];
  List<String> get itemsElement => _itemsElement;

  final List<String> _itemsType = [
    "Mecha",
    "Physic",
    "Bio",
    "Quantum",
    "Imaginary"
  ];

  List<String> get itemsType => _itemsType;

  String _value = "Sort By A-Z";
  String get value => _value;

  MyState _myState = MyState.loading;
  MyState get myState => _myState;

  Color _colorBottom = Colors.red;
  Color get colorBottom => _colorBottom;

  List<Character> _listCharacters = [];
  List<Character> get listCharacters => _listCharacters;

  void changeValueButton(String value) {
    _value = value;
    notifyListeners();
  }

  void sortList() {
    if (_value == "Sort By A-Z") {
      _listCharacters.sort(
        (a, b) => a.nameCharacter.compareTo(b.nameCharacter),
      );
      notifyListeners();
    }

    if (_value == "Sort By Z-A") {
      _listCharacters.sort(
        (a, b) => b.nameCharacter.compareTo(a.nameCharacter),
      );
      notifyListeners();
    }
  }

  void fetchCharacter(String value) async {
    try {
      _myState = MyState.loading;
      notifyListeners();

      final response = await character("character", value);

      response.fold(
        (failure) => throw _mapFailureOrMessage(failure),
        (character) {
          _listCharacters = character;
          _listCharacters.sort(
            (a, b) => a.nameCharacter.compareTo(b.nameCharacter),
          );
        },
      );

      _myState = MyState.hasData;
      notifyListeners();
    } catch (e) {
      _myState = MyState.failed;
      notifyListeners();
    }
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

  String _mapFailureOrMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return throw 'ServerFailure';
      default:
        return throw 'Unexpected Error';
    }
  }
}

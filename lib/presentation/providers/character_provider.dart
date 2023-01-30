import 'package:flutter/material.dart';
import 'package:honkai_assistance/common/util/enum_state.dart';
import 'package:honkai_assistance/domain/usecases/get_character.dart';

import '../../domain/entities/character_entity.dart';

class CharacterProvider extends ChangeNotifier {
  final GetCharacter getCharacter;
  CharacterProvider({required this.getCharacter});

  List<CharacterEntity> _batteluits = [];
  AppState _appState = AppState.loading;
  String _failureMessage = "";
  late Color _bottomColor;
  String _sortValue = 'Sort By A-Z';
  String _role = 'DPS';
  String _typeATK = 'Physical';

  List<CharacterEntity> get battlesuits => _batteluits;
  AppState get appState => _appState;
  Color get bottomColor => _bottomColor;
  String get sortValue => _sortValue;
  String get role => _role;
  String get typeATK => _typeATK;
  String get failureMessage => _failureMessage;

  Future<void> getCharacters() async {
    changeAppState(AppState.loading);

    final failureOrCharacter = await getCharacter.call();

    failureOrCharacter.fold(
      (failure) {
        _failureMessage = failure.message;
        changeAppState(AppState.failed);
      },
      (character) {
        _batteluits = character;
        changeAppState(AppState.loaded);
      },
    );
  }

  changeSortValue(String value) {
    _sortValue = value;

    if (value == "Sort By A-Z") {
      battlesuits.sort(
        (a, b) => a.characterName.compareTo(b.characterName),
      );
    } else {
      battlesuits.sort(
        (a, b) => b.characterName.compareTo(a.characterName),
      );
    }
    notifyListeners();
  }

  changeRole(String value) {
    _role = value;

    if (value == "DPS") {
      battlesuits.sort(
        (a, b) => a.characterRole.compareTo(b.characterRole),
      );
    } else {
      battlesuits.sort(
        (a, b) => b.characterRole.compareTo(a.characterRole),
      );
    }
    notifyListeners();
  }

  changeTypeATK(String value) {
    _typeATK = value;
    notifyListeners();
  }

  changeAppState(AppState state) {
    _appState = state;
    notifyListeners();
  }

  void changeBottomColor(String typeATK) {
    switch (typeATK) {
      case 'Physical':
        _bottomColor = Colors.amber;
        break;
      case 'Ice':
        _bottomColor = Colors.blue;
        break;
      case 'Lightning':
        _bottomColor = Colors.purple;
        break;
      case 'Fire':
        _bottomColor = Colors.red;
        break;
      default:
        _bottomColor = Colors.amber;
    }
  }
}

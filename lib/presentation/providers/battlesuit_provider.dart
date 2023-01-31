import 'package:flutter/material.dart';
import 'package:honkai_assistance/common/util/enum_state.dart';
import 'package:honkai_assistance/domain/usecases/get_character.dart';

import '../../domain/entities/character_entity.dart';

class BattlesuitProvider extends ChangeNotifier {
  final GetCharacter getCharacter;
  BattlesuitProvider({required this.getCharacter});

  List<CharacterEntity> _battlesuits = [];
  AppState _appState = AppState.loading;
  String _failureMessage = "";
  late Color _bottomColor;
  String _sortValue = 'Sort By A-Z';
  String _role = 'Any Role';
  String _typeATK = 'Any ATK';

  List<CharacterEntity> get battlesuits => _battlesuits;
  AppState get appState => _appState;
  Color get bottomColor => _bottomColor;
  String get sortValue => _sortValue;
  String get role => _role;
  String get typeATK => _typeATK;
  String get failureMessage => _failureMessage;

  Future<void> getBattlesuits() async {
    changeAppState(AppState.loading);

    final failureOrCharacter = await getCharacter.call();

    failureOrCharacter.fold(
      (failure) {
        _failureMessage = failure.message;
        changeAppState(AppState.failed);
      },
      (character) {
        _battlesuits = character;
        if (_sortValue == "Sort By A-Z") {
          battlesuits.sort(
            (a, b) => a.characterName.compareTo(b.characterName),
          );
        } else {
          _battlesuits.sort(
            (a, b) => b.characterName.compareTo(a.characterName),
          );
        }
        changeAppState(AppState.loaded);
      },
    );
  }

  Future<void> searchBattlesuit(String value) async {
    if (value.isNotEmpty) {
      await getBattlesuits();
      await changeRole('Any Role');
      await changeTypeATK('Any ATK');
      await changeSortValue('Sort By A-Z');

      _battlesuits = _battlesuits
          .where((e) =>
              e.characterName.toLowerCase().contains(value.toLowerCase()))
          .toList();
    } else {
      await getBattlesuits();
    }
    notifyListeners();
  }

  Future<void> changeSortValue(String value) async {
    _sortValue = value;

    if (value == "Sort By A-Z") {
      _battlesuits.sort(
        (a, b) => a.characterName.compareTo(b.characterName),
      );
    } else {
      _battlesuits.sort(
        (a, b) => b.characterName.compareTo(a.characterName),
      );
    }
    notifyListeners();
  }

  Future<void> changeRole(String value) async {
    if (_role != value) {
      switch (value) {
        case 'DPS':
          await getBattlesuits();
          _battlesuits = _battlesuits
              .where((e) => e.characterTypeATK
                  .contains(_typeATK != "Any ATK" ? _typeATK : ""))
              .toList();
          _battlesuits = _battlesuits
              .where((e) => e.characterRole.contains('DPS'))
              .toList();
          break;
        case 'Support':
          await getBattlesuits();
          _battlesuits = _battlesuits
              .where((e) => e.characterTypeATK
                  .contains(_typeATK != "Any ATK" ? _typeATK : ""))
              .toList();
          _battlesuits = _battlesuits
              .where((e) => e.characterRole.contains('Support'))
              .toList();
          break;
        default:
          await getBattlesuits();
          _battlesuits = _battlesuits
              .where((e) => e.characterTypeATK
                  .contains(_typeATK != "Any ATK" ? _typeATK : ""))
              .toList();
      }
    }

    _role = value;
    notifyListeners();
  }

  Future<void> changeTypeATK(String value) async {
    if (_typeATK != value) {
      switch (value) {
        case 'Physical':
          await getBattlesuits();
          _battlesuits = _battlesuits
              .where((e) =>
                  e.characterRole.contains(_role != "Any Role" ? _role : ""))
              .toList();
          _battlesuits = _battlesuits
              .where((e) => e.characterTypeATK.contains(value))
              .toList();
          break;
        case 'Fire':
          await getBattlesuits();
          _battlesuits = _battlesuits
              .where((e) =>
                  e.characterRole.contains(_role != "Any Role" ? _role : ""))
              .toList();
          _battlesuits = _battlesuits
              .where((e) => e.characterTypeATK.contains(value))
              .toList();

          break;
        case 'Ice':
          await getBattlesuits();
          _battlesuits = _battlesuits
              .where((e) =>
                  e.characterRole.contains(_role != "Any Role" ? _role : ""))
              .toList();
          _battlesuits = _battlesuits
              .where((e) => e.characterTypeATK.contains(value))
              .toList();

          break;
        case 'Lightning':
          await getBattlesuits();
          _battlesuits = _battlesuits
              .where((e) =>
                  e.characterRole.contains(_role != "Any Role" ? _role : ""))
              .toList();
          _battlesuits = _battlesuits
              .where((e) => e.characterTypeATK.contains(value))
              .toList();

          break;
        default:
          await getBattlesuits();
          _battlesuits = _battlesuits
              .where((e) =>
                  e.characterRole.contains(_role != "Any Role" ? _role : ""))
              .toList();
      }
    }
    _typeATK = value;
    notifyListeners();
  }

  void changeAppState(AppState state) {
    _appState = state;
    notifyListeners();
  }

  void resetButton(TextEditingController controller) {
    _role = 'Any Role';
    _typeATK = 'Any ATK';
    _sortValue = 'Sort By A-Z';
    controller.clear();

    getBattlesuits();
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

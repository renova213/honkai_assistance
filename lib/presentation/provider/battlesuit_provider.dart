import 'package:flutter/material.dart';
import 'package:honkai_assistance/common/util/enum_state.dart';

import '../../../domain/entities/character_entity.dart';
import '../../domain/usecases/get_character.dart';

class BattlesuitProvider extends ChangeNotifier {
  final GetCharacter getCharacter;
  BattlesuitProvider({required this.getCharacter});

  List<CharacterEntity> _battlesuits = [];
  List<CharacterEntity> _searchResults = [];
  List<CharacterWeaponEntity> _recommendedWeapons = [];
  List<CharacterWeaponEntity> _otherOptionWeapons = [];
  List<CharacterStigmataEntity> _recommendedTStigmatas = [];
  List<CharacterStigmataEntity> _recommendedMStigmatas = [];
  List<CharacterStigmataEntity> _recommendedBStigmatas = [];
  List<CharacterStigmataEntity> _otherOptionTStigmatas = [];
  List<CharacterStigmataEntity> _otherOptionMStigmatas = [];
  List<CharacterStigmataEntity> _otherOptionBStigmatas = [];
  AppState _appState = AppState.loading;
  String _failureMessage = "";
  late Color _bottomColor;
  String _role = 'Any Role';
  String _typeATK = 'Any Type';
  int _index = 0;

  List<CharacterEntity> get battlesuits => _battlesuits;
  List<CharacterEntity> get searchResults => _searchResults;
  List<CharacterWeaponEntity> get recommendedWeapons => _recommendedWeapons;
  List<CharacterWeaponEntity> get otherOptionWeapons => _otherOptionWeapons;
  List<CharacterStigmataEntity> get recommendedTStigmatas =>
      _recommendedTStigmatas;
  List<CharacterStigmataEntity> get recommendedMStigmatas =>
      _recommendedMStigmatas;
  List<CharacterStigmataEntity> get recommendedBStigmatas =>
      _recommendedBStigmatas;
  List<CharacterStigmataEntity> get otherOptionTStigmatas =>
      _otherOptionTStigmatas;
  List<CharacterStigmataEntity> get otherOptionMStigmatas =>
      _otherOptionMStigmatas;
  List<CharacterStigmataEntity> get otherOptionBStigmatas =>
      _otherOptionBStigmatas;
  AppState get appState => _appState;
  Color get bottomColor => _bottomColor;
  String get role => _role;
  String get typeATK => _typeATK;
  String get failureMessage => _failureMessage;
  int get index => _index;

  Future<void> getBattlesuits() async {
    changeAppState(AppState.loading);

    final failureOBattlesuit = await getCharacter.call();

    failureOBattlesuit.fold(
      (failure) {
        _failureMessage = failure.message;
        changeAppState(AppState.failed);
      },
      (character) {
        _battlesuits = character;

        battlesuits.sort(
          (a, b) => a.characterName.compareTo(b.characterName),
        );

        changeAppState(AppState.loaded);
      },
    );
  }

  Future<void> filterWeapon(
      List<CharacterWeaponEntity> battlesuitWeapons) async {
    _recommendedWeapons = battlesuitWeapons
        .where((e) => e.priority.toLowerCase() == 'recommended')
        .toList();
    _recommendedWeapons.sort((a, b) => b.star.compareTo(a.star));
    _otherOptionWeapons = battlesuitWeapons
        .where((e) => e.priority.toLowerCase() == 'other option')
        .toList();
    _otherOptionWeapons.sort((a, b) => b.star.compareTo(a.star));
    notifyListeners();
  }

  Future<void> filterStigmata(
      List<CharacterStigmataEntity> battlesuitStimatas) async {
    //recommended stigmata
    _recommendedTStigmatas = battlesuitStimatas
        .where((e) =>
            e.priority.toLowerCase() == 'recommended' &&
            e.typeStigmata.toLowerCase() == 't')
        .toList();
    _recommendedMStigmatas = battlesuitStimatas
        .where((e) =>
            e.priority.toLowerCase() == 'recommended' &&
            e.typeStigmata.toLowerCase() == 'm')
        .toList();
    _recommendedBStigmatas = battlesuitStimatas
        .where((e) =>
            e.priority.toLowerCase() == 'recommended' &&
            e.typeStigmata.toLowerCase() == 'b')
        .toList();

    //other option stigmata
    _otherOptionTStigmatas = battlesuitStimatas
        .where((e) =>
            e.priority.toLowerCase() == 'other option' &&
            e.typeStigmata.toLowerCase() == 't')
        .toList();
    _otherOptionMStigmatas = battlesuitStimatas
        .where((e) =>
            e.priority.toLowerCase() == 'other option' &&
            e.typeStigmata.toLowerCase() == 'm')
        .toList();
    _otherOptionBStigmatas = battlesuitStimatas
        .where((e) =>
            e.priority.toLowerCase() == 'other option' &&
            e.typeStigmata.toLowerCase() == 'b')
        .toList();

    _recommendedTStigmatas.sort((a, b) => b.star.compareTo(a.star));
    _recommendedMStigmatas.sort((a, b) => b.star.compareTo(a.star));
    _recommendedBStigmatas.sort((a, b) => b.star.compareTo(a.star));
    _otherOptionTStigmatas.sort((a, b) => b.star.compareTo(a.star));
    _otherOptionMStigmatas.sort((a, b) => b.star.compareTo(a.star));
    _otherOptionBStigmatas.sort((a, b) => b.star.compareTo(a.star));
    notifyListeners();
  }

  Future<void> searchBattlesuit(
      {required String searchValue,
      required String typeValue,
      required String roleValue}) async {
    _typeATK = typeValue;
    _role = roleValue;
    _searchResults = _battlesuits
        .where((e) =>
            e.characterName.toLowerCase().contains(searchValue.toLowerCase()) &&
            e.characterTypeATK.toLowerCase().contains(
                typeValue == "Any Type" ? "" : _typeATK.toLowerCase()) &&
            e.characterRole
                .toLowerCase()
                .contains(roleValue == "Any Role" ? "" : _role.toLowerCase()))
        .toList();
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

  void changeAppState(AppState state) {
    _appState = state;
    notifyListeners();
  }

  //button
  void changeIndex(int index) {
    _index = index;
    notifyListeners();
  }
}

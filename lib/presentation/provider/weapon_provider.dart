import 'package:flutter/material.dart';
import 'package:honkai_assistance/domain/entities/weapon_entity.dart';

import '../../../common/util/enum_state.dart';
import '../../domain/usecases/get_weapon.dart';

class WeaponProvider extends ChangeNotifier {
  final GetWeapon getWeapon;
  WeaponProvider({required this.getWeapon});

  List<WeaponEntity> _weapons = [];
  List<WeaponEntity> _searchResults = [];
  AppState _appState = AppState.loading;
  String _failureMessage = "";
  late Color _bottomColor;
  String _weaponType = "Any Type";

  List<WeaponEntity> get weapons => _weapons;
  List<WeaponEntity> get searchResults => _searchResults;
  AppState get appState => _appState;
  String get failureMessage => _failureMessage;
  Color get bottomColor => _bottomColor;
  String get weaponType => _weaponType;

  Future<void> getWeapons() async {
    changeAppState(AppState.loading);

    final failureOrWeapon = await getWeapon.call();

    failureOrWeapon.fold(
      (failure) {
        _failureMessage = failure.message;
        changeAppState(AppState.failed);
      },
      (weapons) {
        _weapons = weapons;
        _weapons.sort(
          (a, b) => a.weaponName.compareTo(b.weaponName),
        );
        changeAppState(AppState.loaded);
      },
    );
  }

  Future<void> searchWeapon(
      {required String searchValue, required String typeValue}) async {
    _weaponType = typeValue;
    _searchResults = _weapons
        .where(
          (e) =>
              e.weaponName.toLowerCase().contains(searchValue.toLowerCase()) &&
              e.type.toLowerCase().contains(
                  _weaponType == "Any Type" ? "" : _weaponType.toLowerCase()),
        )
        .toList();

    notifyListeners();
  }

  void changeBottomColor(String star) {
    switch (star) {
      case '5.0':
        _bottomColor = Colors.yellow;
        break;
      case '4.0':
        _bottomColor = Colors.purple;
        break;
      case '3.0':
        _bottomColor = Colors.blue;
        break;
      default:
        _bottomColor = Colors.green;
    }
  }

  changeAppState(AppState state) {
    _appState = state;
    notifyListeners();
  }
}

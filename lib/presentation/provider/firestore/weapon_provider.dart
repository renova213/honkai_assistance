import 'package:flutter/foundation.dart';
import 'package:honkai_assistance/domain/entities/weapon_entity.dart';
import 'package:honkai_assistance/domain/usecases/remote/get_weapon.dart';

import '../../../common/util/enum_state.dart';

class WeaponProvider extends ChangeNotifier {
  final GetWeapon getWeapon;
  WeaponProvider({required this.getWeapon});

  List<WeaponEntity> _weapons = [];
  AppState _appState = AppState.loading;
  String _failureMessage = "";

  List<WeaponEntity> get weapons => _weapons;
  AppState get appState => _appState;
  String get failureMessage => _failureMessage;

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

  Future<void> searchWeapon(String value) async {
    if (value.isNotEmpty) {
      await getWeapons();

      _weapons = _weapons
          .where(
              (e) => e.weaponName.toLowerCase().contains(value.toLowerCase()))
          .toList();
    } else {
      await getWeapons();
    }
    notifyListeners();
  }

  changeAppState(AppState state) {
    _appState = state;
    notifyListeners();
  }
}

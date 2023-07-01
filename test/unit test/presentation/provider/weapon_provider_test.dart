import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_assistance/common/constant.dart';
import 'package:honkai_assistance/common/error/error.dart';
import 'package:honkai_assistance/common/util/utils.dart';
import 'package:honkai_assistance/domain/entities/weapon_entity.dart';
import 'package:honkai_assistance/domain/usecases/get_weapon.dart';
import 'package:honkai_assistance/presentation/provider/weapon_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'weapon_provider_test.mocks.dart';

@GenerateMocks([GetWeapon])
void main() {
  WeaponEntity testWeaponEntity = const WeaponEntity(
      weaponName: "string",
      type: "string",
      rank: "string",
      urlImage: "string",
      skillWeapons: [
        SkillWeaponEntity(titleSkill: "string", descriptionSkill: "string")
      ]);

  group('WeaponProvider', () {
    MockGetWeapon usecase = MockGetWeapon();
    WeaponProvider provider = WeaponProvider(getWeapon: usecase);

    test(
        'should update app state and WeaponEntity list on successful data retrieval',
        () async {
      when(usecase.call()).thenAnswer(
        (_) async => Right([testWeaponEntity]),
      );

      await provider.getWeapons();

      expect(provider.appState, AppState.loaded);
      expect(provider.weapons.length, 1);
    });

    test('should update app state and failureMessage on failed data retrieval',
        () async {
      when(usecase.call()).thenAnswer(
        (_) async => const Left(InternetFailure(message: internetError)),
      );

      await provider.getWeapons();

      expect(provider.appState, AppState.failed);
      expect(provider.failureMessage, internetError);
    });
  });
}

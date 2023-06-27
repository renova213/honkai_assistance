import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_assistance/data/models/weapon_model.dart';
import 'package:honkai_assistance/domain/entities/weapon_entity.dart';
import '../../fixtures/fixture_reader.dart';

void main() {
  const testWeaponModel = WeaponModel(
      weaponName: "string",
      type: "string",
      rank: "string",
      urlImage: "string",
      skillWeapons: [
        SkillWeaponModel(titleSkill: "string", descriptionSkill: "string")
      ]);

  test('should be a subclass of WeaponEntity', () {
    expect(testWeaponModel, isA<WeaponEntity>());
  });

  group('fromJson', () {
    test('should return valid model WeaponModel from json', () {
      final List jsonMap = json.decode(
        fixture('weapon.json'),
      );

      final result = WeaponModel.fromMap(jsonMap.first);
      expect(result, testWeaponModel);
    });
  });
}

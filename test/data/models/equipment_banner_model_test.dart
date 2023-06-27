import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_assistance/data/models/equipment_banner_model.dart';
import 'package:honkai_assistance/domain/entities/equipment_banner_entity.dart';
import '../../fixtures/fixture_reader.dart';

void main() {
  const testEquipmentBannerModel = EquipmentBannerModel(
      urlWeaponImage: "string",
      urlStigmataImage: "string",
      weaponName: "string",
      stigmataName: "string",
      endDate: "string");

  test('should be a subclass of EquipmentBannerEntity', () {
    expect(testEquipmentBannerModel, isA<EquipmentBannerEntity>());
  });

  group('fromJson', () {
    test('should return valid model EquipmentBannerModel from json', () {
      final List jsonMap = json.decode(
        fixture('equipment_banner.json'),
      );

      final result = EquipmentBannerModel.fromMap(jsonMap.first);
      expect(result, testEquipmentBannerModel);
    });
  });
}

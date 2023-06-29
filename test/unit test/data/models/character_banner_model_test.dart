import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_assistance/data/models/character_banner_model.dart';
import 'package:honkai_assistance/domain/entities/character_banner_entity.dart';
import '../../../fixtures/fixture_reader.dart';

void main() {
  const testCharacterBannerModel = CharacterBannerModel(
      urlImage: "string", title: "string", endDate: "string");

  test('should be a subclass of CharacterBannerEntity', () {
    expect(testCharacterBannerModel, isA<CharacterBannerEntity>());
  });

  group('fromJson', () {
    test('should return valid model CharacterBannerModel from json', () {
      final List jsonMap = json.decode(
        fixture('character_banner.json'),
      );

      final result = CharacterBannerModel.fromMap(jsonMap.first);
      expect(result, testCharacterBannerModel);
    });
  });
}

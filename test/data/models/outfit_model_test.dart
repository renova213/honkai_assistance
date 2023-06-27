import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_assistance/data/models/outfit_model.dart';
import 'package:honkai_assistance/domain/entities/outfit_entity.dart';
import '../../fixtures/fixture_reader.dart';

void main() {
  const testOutfitModel = OutfitModel(
      outfitName: "string",
      outfitImage: "string",
      grade: "string",
      outfitIcon: "string");

  test('should be a subclass of OutfitEntity', () {
    expect(testOutfitModel, isA<OutfitEntity>());
  });

  group('fromJson', () {
    test('should return valid model OutfitModel from json', () {
      final List jsonMap = json.decode(
        fixture('outfit.json'),
      );

      final result = OutfitModel.fromMap(jsonMap.first);
      expect(result, testOutfitModel);
    });
  });
}

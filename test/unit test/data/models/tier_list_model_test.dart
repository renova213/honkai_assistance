import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_assistance/data/models/tier_list_model.dart';
import 'package:honkai_assistance/domain/entities/tier_list_entity.dart';
import '../../../fixtures/fixture_reader.dart';

void main() {
  const testTierListModel = TierListModel(
      valkyrieName: "string",
      image: "string",
      element: "string",
      role: "string",
      tier: "string");

  test('should be a subclass of TierListEntity', () {
    expect(testTierListModel, isA<TierListEntity>());
  });

  group('fromJson', () {
    test('should return valid model TierListModel from json', () {
      final List jsonMap = json.decode(
        fixture('tier_list.json'),
      );

      final result = TierListModel.fromMap(jsonMap.first);
      expect(result, testTierListModel);
    });
  });
}

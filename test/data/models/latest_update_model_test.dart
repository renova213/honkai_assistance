import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_lab/data/models/latest_update_model.dart';
import 'package:honkai_lab/domain/entities/last_update.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  const testLatestUpdateModel = LatestUpdateModel(
      urlWeb: "urlWeb",
      title: "title",
      description: "description",
      urlImage: "urlImage");

  test('should be a subclass of ChangeLog entity', () {
    expect(testLatestUpdateModel, isA<LatestUpdate>());
  });

  group('fromJson', () {
    test('should return valid model LatestUpdateModel from json', () {
      final List jsonMap = json.decode(
        fixture('latest_update.json'),
      );

      final result = LatestUpdateModel.fromMap(jsonMap.first);
      expect(result, testLatestUpdateModel);
    });
  });
}

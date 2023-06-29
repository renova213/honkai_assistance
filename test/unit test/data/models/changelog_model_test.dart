import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_assistance/data/models/changelog_model.dart';
import 'package:honkai_assistance/domain/entities/changelog_entity.dart';
import '../../../fixtures/fixture_reader.dart';

void main() {
  const testChangeLogModel = ChangelogModel(
      image: "string",
      name: "string",
      tierAfter: "string",
      tierBefore: "string");

  test('should be a subclass of ChangeLogEntity', () {
    expect(testChangeLogModel, isA<ChangelogEntity>());
  });

  group('fromJson', () {
    test('should return valid model ChangelogModel from json', () {
      final List jsonMap = json.decode(
        fixture('changelog.json'),
      );

      final result = ChangelogModel.fromMap(jsonMap.first);
      expect(result, testChangeLogModel);
    });
  });
}

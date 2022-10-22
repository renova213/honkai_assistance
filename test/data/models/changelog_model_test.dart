import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_lab/data/models/changelog_model.dart';
import 'package:honkai_lab/domain/entities/changelog.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  const testChangeLogModel = ChangelogModel(characterLog: <CharacterLogModel>[
    CharacterLogModel(
        nameCharacter: "nameCharacter",
        tierBefore: "tierBefore",
        tierCurrent: "tierCurrent",
        urlImage: "urlImage")
  ], date: "date");

  test('should be a subclass of ChangeLog entity', () {
    expect(testChangeLogModel, isA<Changelog>());
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

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_assistance/data/models/news_update_model.dart';
import 'package:honkai_assistance/domain/entities/news_update_entity.dart';
import '../../fixtures/fixture_reader.dart';

void main() {
  const testNewsUpdateModel = NewsUpdateModel(
      urlWeb: "string",
      date: "string",
      title: "string",
      description: "string",
      urlImage: "string");

  test('should be a subclass of NewsUpdateEntity', () {
    expect(testNewsUpdateModel, isA<NewsUpdateEntity>());
  });

  group('fromJson', () {
    test('should return valid model NewsUpdateModel from json', () {
      final List jsonMap = json.decode(
        fixture('news_update.json'),
      );

      final result = NewsUpdateModel.fromMap(jsonMap.first);
      expect(result, testNewsUpdateModel);
    });
  });
}

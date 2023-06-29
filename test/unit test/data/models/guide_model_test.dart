import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_assistance/data/models/guide_model.dart';
import 'package:honkai_assistance/domain/entities/guide_entity.dart';
import '../../../fixtures/fixture_reader.dart';

void main() {
  const testGuideModel = GuideModel(
      titleGuide: "string",
      urlImage: "string",
      descriptionGuide: "string",
      guideItems: [
        GuideItemModel(title: "string", guideDetails: [
          GuideItemDetailModel(
              description: "string", subtitle: "string", image: "string")
        ])
      ]);

  test('should be a subclass of GuideEntity', () {
    expect(testGuideModel, isA<GuideEntity>());
  });

  group('fromJson', () {
    test('should return valid model GuideModel from json', () {
      final List jsonMap = json.decode(
        fixture('guide.json'),
      );

      final result = GuideModel.fromMap(jsonMap.first);
      expect(result, testGuideModel);
    });
  });
}

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_assistance/data/models/event_model.dart';
import 'package:honkai_assistance/domain/entities/event_entity.dart';
import '../../fixtures/fixture_reader.dart';

void main() {
  const testEventModel =
      EventModel(urlImage: "string", title: "string", endDate: "string");

  test('should be a subclass of EventEntity', () {
    expect(testEventModel, isA<EventEntity>());
  });

  group('fromJson', () {
    test('should return valid model EventModel from json', () {
      final List jsonMap = json.decode(
        fixture('event.json'),
      );

      final result = EventModel.fromMap(jsonMap.first);
      expect(result, testEventModel);
    });
  });
}

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_assistance/data/models/stigmata_model.dart';
import 'package:honkai_assistance/domain/entities/stigmata_entity.dart';
import '../../fixtures/fixture_reader.dart';

void main() {
  const testStigmataModel = StigmataModel(
      stigmataName: "string",
      stigmataImage: "string",
      stigmataItems: [
        StigmataItemModel(
            star: "string",
            stigmataImage: "string",
            stigmataType: "string",
            stigmataEffects: [
              StigmataEffectModel(
                  titleEffect: "string", descriptionEffect: "string")
            ],
            stigmataPieceName: "string")
      ],
      setEffects: [
        SetEffectModel(setName: "string", description: "string")
      ]);

  test('should be a subclass of StigmataEntity', () {
    expect(testStigmataModel, isA<StigmataEntity>());
  });

  group('fromJson', () {
    test('should return valid model StigmataModel from json', () {
      final List jsonMap = json.decode(
        fixture('stigmata.json'),
      );

      final result = StigmataModel.fromMap(jsonMap.first);
      expect(result, testStigmataModel);
    });
  });
}

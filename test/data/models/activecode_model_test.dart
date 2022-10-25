import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_lab/data/models/activecode_model.dart';
import 'package:honkai_lab/domain/entities/active_code.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  const testActiveCodeModel = ActiveCodeModel(
      code: "60AHDASFBLAFL",
      reward: "300 Crystals, 2888 Asterite, 1x SSS Trial card Option",
      isActive: true,
      server: "Global");

  test('should be a subclass of ActiveCode entity', () {
    expect(testActiveCodeModel, isA<ActiveCode>());
  });

  group('fromJson', () {
    test('should return valid model ActiveCodeModel from json', () {
      final List jsonMap = json.decode(
        fixture('active_code.json'),
      );

      final result = ActiveCodeModel.fromMap(jsonMap.first);
      expect(result, testActiveCodeModel);
    });
  });
}

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_assistance/data/models/redeem_code_model.dart';
import 'package:honkai_assistance/domain/entities/redeem_code_entity.dart';
import '../../fixtures/fixture_reader.dart';

void main() {
  const testRedeemCodeModel =
      RedeemCodeModel(code: "string", reward: "string", server: "string");

  test('should be a subclass of RedeemCodeEntity', () {
    expect(testRedeemCodeModel, isA<RedeemCodeEntity>());
  });

  group('fromJson', () {
    test('should return valid model RedeemCodeModel from json', () {
      final List jsonMap = json.decode(
        fixture('redeem_code.json'),
      );

      final result = RedeemCodeModel.fromMap(jsonMap.first);
      expect(result, testRedeemCodeModel);
    });
  });
}

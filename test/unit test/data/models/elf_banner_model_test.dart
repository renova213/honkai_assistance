import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_assistance/data/models/elf_banner_model.dart';
import 'package:honkai_assistance/domain/entities/elf_banner_entity.dart';
import '../../../fixtures/fixture_reader.dart';

void main() {
  const testElfBannerModel =
      ElfBannerModel(urlImage: "string", title: "string", endDate: "string");

  test('should be a subclass of ElfBannerEntity', () {
    expect(testElfBannerModel, isA<ElfBannerEntity>());
  });

  group('fromJson', () {
    test('should return valid model ElfBannerModel from json', () {
      final List jsonMap = json.decode(
        fixture('elf_banner.json'),
      );

      final result = ElfBannerModel.fromMap(jsonMap.first);
      expect(result, testElfBannerModel);
    });
  });
}

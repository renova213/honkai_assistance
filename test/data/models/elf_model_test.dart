import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_assistance/data/models/elf_model.dart';
import 'package:honkai_assistance/domain/entities/elf_entity.dart';
import '../../fixtures/fixture_reader.dart';

void main() {
  const testElfModel = ElfModel(
      elfName: "string",
      urlImage: "string",
      typeATK: "string",
      urlImageATK: "string",
      elfSkills: [
        ElfSkillModel(
            urlImage: "string", skillName: "string", descriptionSkill: "string")
      ],
      elfSpecialities: [
        ElfSpecialityModel(urlImage: "string", name: "string")
      ]);

  test('should be a subclass of ElfEntity', () {
    expect(testElfModel, isA<ElfEntity>());
  });

  group('fromJson', () {
    test('should return valid model ElfModel from json', () {
      final List jsonMap = json.decode(
        fixture('elf.json'),
      );

      final result = ElfModel.fromMap(jsonMap.first);
      expect(result, testElfModel);
    });
  });
}

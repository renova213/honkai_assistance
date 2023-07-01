import 'package:honkai_assistance/domain/entities/elf_entity.dart';

class ElfModel extends ElfEntity {
  const ElfModel(
      {required super.elfName,
      required super.urlImage,
      required super.typeATK,
      required super.urlImageATK,
      required super.elfSkills,
      required super.elfSpecialities});

  factory ElfModel.fromMap(Map<String, dynamic> map) => ElfModel(
      elfName: map['elfName'],
      urlImage: map['urlImage'],
      typeATK: map['typeATK'],
      urlImageATK: map['urlImageATK'],
      elfSpecialities: map['elfSpecialities'] != null
          ? (map['elfSpecialities'] as List)
              .map((e) => ElfSpecialityModel.fromMap(e))
              .toList()
          : [],
      elfSkills: map['elfSkills'] != null
          ? (map['elfSkills'] as List)
              .map((e) => ElfSkillModel.fromMap(e))
              .toList()
          : []);
}

class ElfSkillModel extends ElfSkillEntity {
  const ElfSkillModel(
      {required super.urlImage,
      required super.skillName,
      required super.descriptionSkill});

  factory ElfSkillModel.fromMap(Map<String, dynamic> map) => ElfSkillModel(
      urlImage: map['urlImage'],
      skillName: map['skillName'],
      descriptionSkill: map['descriptionSkill']);
}

class ElfSpecialityModel extends ElfSpecialityEntity {
  const ElfSpecialityModel({required super.urlImage, required super.name});

  factory ElfSpecialityModel.fromMap(Map<String, dynamic> map) =>
      ElfSpecialityModel(urlImage: map['urlImage'], name: map['name']);
}

import 'package:equatable/equatable.dart';

class ElfEntity extends Equatable {
  final String elfName;
  final String urlImage;
  final String typeATK;
  final String urlImageATK;
  final List<ElfSpecialityEntity>? elfSpecialities;
  final List<ElfSkillEntity>? elfSkills;
  const ElfEntity(
      {required this.elfName,
      required this.urlImage,
      required this.typeATK,
      required this.urlImageATK,
      this.elfSpecialities,
      this.elfSkills});

  @override
  List<Object> get props => [
        elfName,
        urlImage,
        typeATK,
        urlImageATK,
        elfSpecialities!,
        elfSkills!,
      ];
}

class ElfSpecialityEntity extends Equatable {
  final String urlImage;
  final String name;

  const ElfSpecialityEntity({required this.urlImage, required this.name});

  @override
  List<Object> get props => [urlImage, name];
}

class ElfSkillEntity extends Equatable {
  final String urlImage;
  final String skillName;
  final String descriptionSkill;

  const ElfSkillEntity(
      {required this.urlImage,
      required this.skillName,
      required this.descriptionSkill});

  @override
  List<Object> get props => [urlImage, skillName, descriptionSkill];
}

import 'package:honkai_assistance/domain/entities/weapon_entity.dart';

class WeaponModel extends WeaponEntity {
  const WeaponModel(
      {required super.weaponName,
      required super.rank,
      required super.urlImage,
      required super.skillWeapons});

  factory WeaponModel.fromMap(Map<String, dynamic> map) => WeaponModel(
      weaponName: map['weaponName'],
      rank: map['rank'],
      urlImage: map['urlImage'],
      skillWeapons: (map['skillWeapons'] as List)
          .map((e) => SkillWeaponModel.fromMap(e))
          .toList());
}

class SkillWeaponModel extends SkillWeaponEntity {
  const SkillWeaponModel(
      {required super.titleSkill, required super.descriptionSkill});

  factory SkillWeaponModel.fromMap(Map<String, dynamic> map) =>
      SkillWeaponModel(
          titleSkill: map['titleSkill'],
          descriptionSkill: map['descriptionSkill']);
}

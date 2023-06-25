import 'package:equatable/equatable.dart';

class WeaponEntity extends Equatable {
  final String weaponName;
  final String rank;
  final String type;
  final String urlImage;
  final List<SkillWeaponEntity> skillWeapons;

  const WeaponEntity(
      {required this.weaponName,
      required this.type,
      required this.rank,
      required this.urlImage,
      required this.skillWeapons});

  @override
  List<Object> get props => [weaponName, rank, urlImage, skillWeapons, type];
}

class SkillWeaponEntity extends Equatable {
  final String titleSkill;
  final String descriptionSkill;
  const SkillWeaponEntity(
      {required this.titleSkill, required this.descriptionSkill});

  @override
  List<Object> get props => [titleSkill, descriptionSkill];
}

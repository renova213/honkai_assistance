import 'package:equatable/equatable.dart';

class CharacterEntity extends Equatable {
  final String characterName;
  final String urlImageCharacter;
  final String urlImageChibi;
  final String urlImageATK;
  final String characterRole;
  final String characterTypeATK;
  final List<CharacterSpecialityEntity>? characterSpeciality;
  final CharacterBiographyEntity? characterBiography;
  final List<CharacterWeaponEntity>? characterWeapon;
  final List<CharacterStigmataEntity>? characterStigmata;
  final List<CharacterTeamEntity>? characterTeam;
  const CharacterEntity(
      {required this.characterName,
      required this.urlImageCharacter,
      required this.urlImageChibi,
      required this.urlImageATK,
      required this.characterRole,
      required this.characterTypeATK,
      this.characterSpeciality,
      this.characterBiography,
      this.characterWeapon,
      this.characterStigmata,
      this.characterTeam});

  @override
  List<Object> get props => [
        characterName,
        urlImageCharacter,
        urlImageChibi,
        urlImageATK,
        characterRole,
        characterTypeATK,
        characterSpeciality!,
        characterBiography!,
        characterWeapon!,
        characterStigmata!,
        characterTeam!
      ];
}

class CharacterSpecialityEntity extends Equatable {
  final String urlImage;
  final String name;

  const CharacterSpecialityEntity({required this.urlImage, required this.name});
  @override
  List<Object> get props => [urlImage, name];
}

class CharacterBiographyEntity extends Equatable {
  final String rank;
  final String typeElement;
  final String typeATK;
  final String backgroundDetail;
  final String dateBirth;
  final String gender;
  final String organization;
  final String height;
  final String weight;
  final String birthplace;

  const CharacterBiographyEntity(
      {required this.rank,
      required this.typeElement,
      required this.typeATK,
      required this.backgroundDetail,
      required this.birthplace,
      required this.dateBirth,
      required this.gender,
      required this.height,
      required this.organization,
      required this.weight});

  @override
  List<Object> get props => [
        rank,
        typeElement,
        typeATK,
        backgroundDetail,
        dateBirth,
        gender,
        organization,
        height,
        weight,
        birthplace
      ];
}

class CharacterWeaponEntity extends Equatable {
  final String priority;
  final String name;
  final String urlImage;
  final String star;
  final List<WeaponSkillEntity>? weaponSkill;

  const CharacterWeaponEntity(
      {required this.priority,
      required this.name,
      required this.star,
      required this.urlImage,
      this.weaponSkill});

  @override
  List<Object> get props => [priority, name, urlImage, star, weaponSkill!];
}

class WeaponSkillEntity extends Equatable {
  final String title;
  final String description;

  const WeaponSkillEntity({required this.title, required this.description});

  @override
  List<Object> get props => [title, description];
}

class CharacterStigmataEntity extends Equatable {
  final String priority;
  final String typeStigmata;
  final String name;
  final String setName;
  final String urlImage;
  final String star;
  final List<CharacterStigmataEffectEntity>? stigmataEffect;

  const CharacterStigmataEntity(
      {required this.priority,
      required this.name,
      required this.star,
      required this.setName,
      required this.typeStigmata,
      required this.urlImage,
      this.stigmataEffect});
  @override
  List<Object> get props =>
      [priority, typeStigmata, name, urlImage, star, setName, stigmataEffect!];
}

class CharacterStigmataEffectEntity extends Equatable {
  final String title;
  final String description;

  const CharacterStigmataEffectEntity(
      {required this.title, required this.description});
  @override
  List<Object> get props => [title, description];
}

class CharacterTeamEntity extends Equatable {
  final List<TeamListEntity> teamList;

  const CharacterTeamEntity({required this.teamList});
  @override
  List<Object> get props => [teamList];
}

class TeamListEntity extends Equatable {
  final String name;
  final String urlImage;

  const TeamListEntity({required this.name, required this.urlImage});
  @override
  List<Object> get props => [name, urlImage];
}

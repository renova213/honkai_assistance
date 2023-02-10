import 'package:honkai_assistance/domain/entities/character_entity.dart';

class CharacterModel extends CharacterEntity {
  const CharacterModel(
      {required super.characterName,
      required super.urlImageCharacter,
      required super.urlImageChibi,
      required super.urlImageATK,
      required super.characterRole,
      required super.characterTypeATK,
      super.characterSpeciality,
      super.characterBiography,
      super.characterWeapon,
      super.characterStigmata,
      super.characterTeam});

  factory CharacterModel.fromMap(Map<String, dynamic> map) => CharacterModel(
        characterName: map['characterName'],
        urlImageCharacter: map['urlImageCharacter'],
        urlImageChibi: map['urlImageChibi'],
        urlImageATK: map['urlImageATK'],
        characterRole: map['characterRole'],
        characterTypeATK: map['characterTypeATK'],
        characterSpeciality: map['characterSpeciality'] != null
            ? (map['characterSpeciality'] as List)
                .map((e) => CharacterSpecialityModel.fromMap(e))
                .toList()
            : [],
        characterBiography: map['characterBiography'] != null
            ? CharacterBiographyModel.fromMap(map['characterBiography'])
            : const CharacterBiographyModel(
                rank: "null",
                typeElement: "null",
                typeATK: "null",
                backgroundDetail: "null",
                birthplace: "null",
                dateBirth: "null",
                gender: "null",
                height: "null",
                organization: "null",
                weight: "null"),
        characterWeapon: map['characterWeapon'] != null
            ? (map['characterWeapon'] as List)
                .map((e) => CharacterWeaponModel.fromMap(e))
                .toList()
            : [],
        characterStigmata: map['characterStigmata'] != null
            ? (map['characterStigmata'] as List)
                .map((e) => CharacterStigmataModel.fromMap(e))
                .toList()
            : [],
        characterTeam: map['characterTeam'] != null
            ? (map['characterTeam'] as List)
                .map((e) => CharacterTeamModel.fromMap(e))
                .toList()
            : [],
      );
}

class CharacterSpecialityModel extends CharacterSpecialityEntity {
  const CharacterSpecialityModel(
      {required super.urlImage, required super.name});

  factory CharacterSpecialityModel.fromMap(Map<String, dynamic> map) =>
      CharacterSpecialityModel(urlImage: map['urlImage'], name: map['name']);
}

class CharacterBiographyModel extends CharacterBiographyEntity {
  const CharacterBiographyModel(
      {required super.rank,
      required super.typeElement,
      required super.typeATK,
      required super.backgroundDetail,
      required super.birthplace,
      required super.dateBirth,
      required super.gender,
      required super.height,
      required super.organization,
      required super.weight});

  factory CharacterBiographyModel.fromMap(Map<String, dynamic> map) =>
      CharacterBiographyModel(
          rank: map['rank'],
          typeElement: map['typeElement'],
          typeATK: map['typeATK'],
          backgroundDetail: map['backgroundDetail'],
          birthplace: map['birthplace'],
          dateBirth: map['dateBirth'],
          gender: map['gender'],
          height: map['height'],
          organization: map['organization'],
          weight: map['weight']);
}

class CharacterWeaponModel extends CharacterWeaponEntity {
  const CharacterWeaponModel(
      {required super.priority,
      required super.name,
      required super.star,
      required super.urlImage,
      super.weaponSkill});

  factory CharacterWeaponModel.fromMap(Map<String, dynamic> map) =>
      CharacterWeaponModel(
          priority: map['priority'],
          name: map['name'],
          star: map['star'],
          urlImage: map['urlImage'],
          weaponSkill: map['weaponSkill'] != null
              ? (map['weaponSkill'] as List)
                  .map((e) => WeaponSkillModel.fromMap(e))
                  .toList()
              : []);
}

class WeaponSkillModel extends WeaponSkillEntity {
  const WeaponSkillModel({required super.title, required super.description});

  factory WeaponSkillModel.fromMap(Map<String, dynamic> map) =>
      WeaponSkillModel(title: map['title'], description: map['description']);
}

class CharacterStigmataModel extends CharacterStigmataEntity {
  const CharacterStigmataModel(
      {required super.priority,
      required super.name,
      required super.star,
      required super.typeStigmata,
      required super.urlImage,
      super.stigmataEffect});

  factory CharacterStigmataModel.fromMap(Map<String, dynamic> map) =>
      CharacterStigmataModel(
          priority: map['priority'],
          name: map['name'],
          star: map['star'],
          typeStigmata: map['typeStigmata'],
          urlImage: map['urlImage'],
          stigmataEffect: map['stigmataEffect'] != null
              ? (map['stigmataEffect'] as List)
                  .map((e) => CharacterStigmataEffectModel.fromMap(e))
                  .toList()
              : []);
}

class CharacterStigmataEffectModel extends CharacterStigmataEffectEntity {
  const CharacterStigmataEffectModel(
      {required super.title, required super.description});

  factory CharacterStigmataEffectModel.fromMap(Map<String, dynamic> map) =>
      CharacterStigmataEffectModel(
          title: map['title'], description: map['description']);
}

class CharacterTeamModel extends CharacterTeamEntity {
  const CharacterTeamModel({required super.teamList});

  factory CharacterTeamModel.fromMap(Map<String, dynamic> map) =>
      CharacterTeamModel(
          teamList: (map['teamList']) != null
              ? (map['teamList'] as List)
                  .map((e) => TeamListModel.fromMap(e))
                  .toList()
              : []);
}

class TeamListModel extends TeamListEntity {
  const TeamListModel({required super.name, required super.urlImage});

  factory TeamListModel.fromMap(Map<String, dynamic> map) =>
      TeamListModel(name: map['name'], urlImage: map['urlImage']);
}

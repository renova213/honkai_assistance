import 'package:honkai_lab/domain/entities/character.dart';

class CharacterModel extends Character {
  const CharacterModel(
      {required super.element,
      required super.image,
      required super.imageChibi,
      required super.nameCharacter,
      required super.tier,
      required super.elementImage,
      required super.role,
      required super.detail});

  factory CharacterModel.fromMap(Map<String, dynamic> json) => CharacterModel(
        element: json["element"],
        image: json["image"],
        imageChibi: json["imageChibi"],
        nameCharacter: json["nameCharacter"],
        tier: json["tier"],
        elementImage: json["elementImage"],
        role: json['role'],
        detail: DetailModel.fromMap(
          json['detail'],
        ),
      );
}

class DetailModel extends Detail {
  const DetailModel(
      {required super.characterProfile,
      required super.rankUpLevel,
      required super.characterEquipment,
      required super.characterTeam,
      required super.characterElysianRealm});
  factory DetailModel.fromMap(Map<String, dynamic> json) => DetailModel(
        characterProfile: CharacterProfileModel.fromMap(
          json["profile"],
        ),
        rankUpLevel: (json['rankUpLevel'] as List)
            .map(
              (e) => RankUpLevelModel.fromMap(e),
            )
            .toList(),
        characterEquipment: CharacterEquipmentModel.fromMap(
          json['characterEquipment'],
        ),
        characterTeam: (json['characterTeam'] as List)
            .map(
              (e) => CharacterTeamModel.fromMap(e),
            )
            .toList(),
        characterElysianRealm: CharacterElysianRealmModel.fromMap(
          json["characterElysianRealm"],
        ),
      );
}

class CharacterProfileModel extends CharacterProfile {
  const CharacterProfileModel(
      {required super.dateBirth,
      required super.battlesuitDetail,
      required super.gender,
      required super.organization,
      required super.height,
      required super.birthplace,
      required super.weight});
  factory CharacterProfileModel.fromMap(Map<String, dynamic> json) =>
      CharacterProfileModel(
        dateBirth: json["dateBirth"],
        battlesuitDetail: json["battlesuitDetail"],
        gender: json["gender"],
        organization: json["organization"],
        height: json["height"],
        birthplace: json["birthplace"],
        weight: json["weight"],
      );
}

class RankUpLevelModel extends RankUpLevel {
  const RankUpLevelModel({required super.rankUp, required super.description});
  factory RankUpLevelModel.fromMap(Map<String, dynamic> json) =>
      RankUpLevelModel(
        rankUp: json['rankUp'],
        description: json['description'],
      );
}

class CharacterEquipmentModel extends CharacterEquipment {
  const CharacterEquipmentModel(
      {required super.stigmatas, required super.weapons});

  factory CharacterEquipmentModel.fromMap(Map<String, dynamic> json) =>
      CharacterEquipmentModel(
        stigmatas: (json['stigmatas'] as List)
            .map(
              (e) => EquipmentStigmataCharacterModel.froMap(e),
            )
            .toList(),
        weapons: (json['weapons'] as List)
            .map(
              (e) => EquipmentWeaponCharacterModel.froMap(e),
            )
            .toList(),
      );
}

class EquipmentStigmataCharacterModel extends EquipmentStigmataCharacter {
  const EquipmentStigmataCharacterModel(
      {required super.nameStigmata,
      required super.rank,
      required super.urlImage});

  factory EquipmentStigmataCharacterModel.froMap(Map<String, dynamic> json) =>
      EquipmentStigmataCharacterModel(
        nameStigmata: json['nameStigmata'],
        rank: json['rank'],
        urlImage: json['urlImage'],
      );
}

class EquipmentWeaponCharacterModel extends EquipmentWeaponCharacter {
  const EquipmentWeaponCharacterModel(
      {required super.nameWeapon,
      required super.rank,
      required super.urlImage});

  factory EquipmentWeaponCharacterModel.froMap(Map<String, dynamic> json) =>
      EquipmentWeaponCharacterModel(
        nameWeapon: json['nameWeapon'],
        rank: json['rank'],
        urlImage: json['urlImage'],
      );
}

class CharacterTeamModel extends CharacterTeam {
  const CharacterTeamModel(
      {required super.characterTeam, required super.nameTeam});

  factory CharacterTeamModel.fromMap(Map<String, dynamic> json) =>
      CharacterTeamModel(
        characterTeam: (json['characterTeamItem'] as List)
            .map(
              (e) => CharacterTeamItemModel.froMap(e),
            )
            .toList(),
        nameTeam: json['nameTeam'],
      );
}

class CharacterTeamItemModel extends CharacterTeamItem {
  const CharacterTeamItemModel(
      {required super.nameCharacter, required super.urlImage});

  factory CharacterTeamItemModel.froMap(Map<String, dynamic> json) =>
      CharacterTeamItemModel(
        nameCharacter: json['nameCharacter'],
        urlImage: json['urlImage'],
      );
}

class CharacterElysianRealmModel extends CharacterElysianRealm {
  const CharacterElysianRealmModel(
      {required super.recommendedSetup,
      required super.coreSignet,
      required super.reinforcementSignet});
  factory CharacterElysianRealmModel.fromMap(Map<String, dynamic> json) =>
      CharacterElysianRealmModel(
        recommendedSetup: RecommendedSetupModel.fromMap(
          json["recommendedSetup"],
        ),
        coreSignet: (json["coreSignet"] as List)
            .map(
              (e) => CoreSignetModel.fromMap(e),
            )
            .toList(),
        reinforcementSignet: (json["reinforcementSignet"] as List)
            .map(
              (e) => ReinforcementSignetModel.fromMap(e),
            )
            .toList(),
      );
}

class RecommendedSetupModel extends RecommendedSetup {
  const RecommendedSetupModel(
      {required super.emblemSetup,
      required super.setupSignet,
      required super.supportSetup});
  factory RecommendedSetupModel.fromMap(Map<String, dynamic> json) =>
      RecommendedSetupModel(
        emblemSetup: (json["emblemSetup"] as List)
            .map(
              (e) => EmblemSetupModel.fromMap(e),
            )
            .toList(),
        setupSignet: (json["setupSignet"] as List)
            .map(
              (e) => SetupSignetModel.fromMap(e),
            )
            .toList(),
        supportSetup: (json["supportSetup"] as List)
            .map(
              (e) => SupportSetupModel.fromMap(e),
            )
            .toList(),
      );
}

class EmblemSetupModel extends EmblemSetup {
  const EmblemSetupModel({required super.contents1, required super.contents2});
  factory EmblemSetupModel.fromMap(Map<String, dynamic> json) =>
      EmblemSetupModel(
        contents1: json["contents1"],
        contents2: json["contents2"],
      );
}

class SupportSetupModel extends SupportSetup {
  const SupportSetupModel(
      {required super.contents1,
      required super.contents2,
      required super.contents3});
  factory SupportSetupModel.fromMap(Map<String, dynamic> json) =>
      SupportSetupModel(
        contents1: json["contents1"],
        contents2: json["contents2"],
        contents3: json["contents3"],
      );
}

class SetupSignetModel extends SetupSignet {
  const SetupSignetModel({required super.contents1, required super.contents2});
  factory SetupSignetModel.fromMap(Map<String, dynamic> json) =>
      SetupSignetModel(
        contents1: json["contents1"],
        contents2: json["contents2"],
      );
}

class CoreSignetModel extends CoreSignet {
  const CoreSignetModel({required super.contents1, required super.contents2});
  factory CoreSignetModel.fromMap(Map<String, dynamic> json) => CoreSignetModel(
        contents1: json["contents1"],
        contents2: json["contents2"],
      );
}

class ReinforcementSignetModel extends ReinforcementSignet {
  const ReinforcementSignetModel(
      {required super.contents1, required super.contents2});
  factory ReinforcementSignetModel.fromMap(Map<String, dynamic> json) =>
      ReinforcementSignetModel(
        contents1: json["contents1"],
        contents2: json["contents2"],
      );
}

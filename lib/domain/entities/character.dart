import 'package:equatable/equatable.dart';

class Character extends Equatable {
  final String element;
  final String image;
  final String imageChibi;
  final String nameCharacter;
  final String tier;
  final String elementImage;
  final String role;
  final Detail detail;

  const Character(
      {required this.element,
      required this.image,
      required this.imageChibi,
      required this.nameCharacter,
      required this.tier,
      required this.elementImage,
      required this.role,
      required this.detail});

  @override
  List<Object> get props => [
        element,
        image,
        imageChibi,
        nameCharacter,
        tier,
        elementImage,
        role,
        detail
      ];
}

class Detail extends Equatable {
  final CharacterProfile characterProfile;
  final List<RankUpLevel> rankUpLevel;
  final CharacterEquipment characterEquipment;
  final List<CharacterTeam> characterTeam;
  final CharacterElysianRealm characterElysianRealm;
  const Detail(
      {required this.characterProfile,
      required this.rankUpLevel,
      required this.characterEquipment,
      required this.characterTeam,
      required this.characterElysianRealm});
  @override
  List<Object> get props => [
        characterProfile,
        rankUpLevel,
        characterEquipment,
        characterTeam,
        characterElysianRealm
      ];
}

class CharacterProfile extends Equatable {
  final String battlesuitDetail;
  final String dateBirth;
  final String gender;
  final String organization;
  final String height;
  final String weight;
  final String birthplace;

  const CharacterProfile(
      {required this.dateBirth,
      required this.battlesuitDetail,
      required this.gender,
      required this.organization,
      required this.height,
      required this.birthplace,
      required this.weight});
  @override
  List<Object> get props => [
        dateBirth,
        battlesuitDetail,
        gender,
        organization,
        height,
        weight,
        birthplace
      ];
}

class RankUpLevel extends Equatable {
  final String rankUp;
  final String description;

  const RankUpLevel({required this.rankUp, required this.description});
  @override
  List<Object> get props => [rankUp, description];
}

class CharacterEquipment extends Equatable {
  final List<EquipmentStigmataCharacter> stigmatas;
  final List<EquipmentWeaponCharacter> weapons;

  const CharacterEquipment({required this.stigmatas, required this.weapons});

  @override
  List<Object> get props => [stigmatas, weapons];
}

class EquipmentStigmataCharacter extends Equatable {
  final String rank;
  final String nameStigmata;
  final String urlImage;
  const EquipmentStigmataCharacter(
      {required this.nameStigmata, required this.rank, required this.urlImage});
  @override
  List<Object> get props => [rank, nameStigmata, urlImage];
}

class EquipmentWeaponCharacter extends Equatable {
  final String rank;
  final String nameWeapon;
  final String urlImage;

  const EquipmentWeaponCharacter(
      {required this.nameWeapon, required this.rank, required this.urlImage});
  @override
  List<Object> get props => [rank, nameWeapon, urlImage];
}

class CharacterTeam extends Equatable {
  final String nameTeam;
  final List<CharacterTeamItem> characterTeam;

  const CharacterTeam({required this.characterTeam, required this.nameTeam});
  @override
  List<Object> get props => [characterTeam, nameTeam];
}

class CharacterTeamItem extends Equatable {
  final String nameCharacter;
  final String urlImage;

  const CharacterTeamItem(
      {required this.nameCharacter, required this.urlImage});
  @override
  List<Object> get props => [
        nameCharacter,
        urlImage,
      ];
}

class CharacterElysianRealm extends Equatable {
  final RecommendedSetup recommendedSetup;
  final List<CoreSignet> coreSignet;
  final List<ReinforcementSignet> reinforcementSignet;

  const CharacterElysianRealm(
      {required this.recommendedSetup,
      required this.coreSignet,
      required this.reinforcementSignet});
  @override
  List<Object> get props => [recommendedSetup, coreSignet, reinforcementSignet];
}

class RecommendedSetup extends Equatable {
  final List<EmblemSetup> emblemSetup;
  final List<SupportSetup> supportSetup;
  final List<SetupSignet> setupSignet;
  const RecommendedSetup(
      {required this.emblemSetup,
      required this.setupSignet,
      required this.supportSetup});
  @override
  List<Object> get props => [emblemSetup, supportSetup, setupSignet];
}

class EmblemSetup extends Equatable {
  final String contents1;
  final String contents2;
  const EmblemSetup({required this.contents1, required this.contents2});
  @override
  List<Object> get props => [contents1, contents2];
}

class SupportSetup extends Equatable {
  final String contents1;
  final String contents2;
  final String contents3;
  const SupportSetup(
      {required this.contents1,
      required this.contents2,
      required this.contents3});
  @override
  List<Object> get props => [contents1, contents2];
}

class SetupSignet extends Equatable {
  final String contents1;
  final String contents2;
  const SetupSignet({required this.contents1, required this.contents2});
  @override
  List<Object> get props => [contents1, contents2];
}

class CoreSignet extends Equatable {
  final String contents1;
  final String contents2;
  const CoreSignet({required this.contents1, required this.contents2});
  @override
  List<Object> get props => [contents1, contents2];
}

class ReinforcementSignet extends Equatable {
  final String contents1;
  final String contents2;
  const ReinforcementSignet({required this.contents1, required this.contents2});
  @override
  List<Object> get props => [contents1, contents2];
}

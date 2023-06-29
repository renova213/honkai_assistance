import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_assistance/data/datasources/remote_data_source.dart';
import 'package:honkai_assistance/data/models/changelog_model.dart';
import 'package:honkai_assistance/data/models/character_banner_model.dart';
import 'package:honkai_assistance/data/models/character_model.dart';
import 'package:honkai_assistance/data/models/elf_banner_model.dart';
import 'package:honkai_assistance/data/models/elf_model.dart';
import 'package:honkai_assistance/data/models/equipment_banner_model.dart';
import 'package:honkai_assistance/data/models/event_model.dart';
import 'package:honkai_assistance/data/models/guide_model.dart';
import 'package:honkai_assistance/data/models/news_update_model.dart';
import 'package:honkai_assistance/data/models/outfit_model.dart';
import 'package:honkai_assistance/data/models/redeem_code_model.dart';
import 'package:honkai_assistance/data/models/stigmata_model.dart';
import 'package:honkai_assistance/data/models/tier_list_model.dart';
import 'package:honkai_assistance/data/models/weapon_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'remote_data_source_test.mocks.dart';

@GenerateMocks([RemoteDataSourceImpl])
void main() {
  final MockRemoteDataSourceImpl dataSourceImpl = MockRemoteDataSourceImpl();

  const testChangelogModel = ChangelogModel(
      image: "string",
      name: "string",
      tierAfter: "string",
      tierBefore: "string");

  const testCharacterBannerModel = CharacterBannerModel(
      urlImage: "string", title: "string", endDate: "string");

  CharacterModel testCharacterModel = const CharacterModel(
      characterName: "string",
      urlImageCharacter: "string",
      urlImageAvatar: "string",
      urlImageATK: "string",
      characterRole: "string",
      characterTypeATK: "string",
      characterSpeciality: <CharacterSpecialityModel>[
        CharacterSpecialityModel(urlImage: "string", name: "string")
      ],
      characterBiography: CharacterBiographyModel(
          rank: "string",
          typeElement: "string",
          typeATK: "string",
          backgroundDetail: "string",
          birthplace: "string",
          dateBirth: "string",
          gender: "string",
          height: "string",
          organization: "string",
          weight: "string"),
      characterWeapon: <CharacterWeaponModel>[
        CharacterWeaponModel(
            priority: "string",
            name: "string",
            star: "string",
            urlImage: "string",
            weaponSkill: [
              WeaponSkillModel(title: "string", description: "string")
            ])
      ],
      characterStigmata: <CharacterStigmataModel>[
        CharacterStigmataModel(
            priority: "string",
            name: "string",
            star: "string",
            setName: "string",
            typeStigmata: "string",
            urlImage: "string",
            stigmataEffect: [
              CharacterStigmataEffectModel(
                  title: "string", description: "string")
            ])
      ],
      characterTeam: <CharacterTeamModel>[
        CharacterTeamModel(
            teamList: [TeamListModel(name: "string", urlImage: "string")])
      ]);

  const testElfBannerModel =
      ElfBannerModel(urlImage: "string", title: "string", endDate: "string");

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

  const testEquipmentBannerModel = EquipmentBannerModel(
      urlWeaponImage: "string",
      urlStigmataImage: "string",
      weaponName: "string",
      stigmataName: "string",
      endDate: "string");

  const testEventModel =
      EventModel(urlImage: "string", title: "string", endDate: "string");

  const testGuideModel = GuideModel(
      titleGuide: "string",
      urlImage: "string",
      descriptionGuide: "string",
      guideItems: [
        GuideItemModel(title: "string", guideDetails: [
          GuideItemDetailModel(
              description: "string", subtitle: "string", image: "string")
        ])
      ]);

  const testNewsUpdateModel = NewsUpdateModel(
      urlWeb: "string",
      date: "string",
      title: "string",
      description: "string",
      urlImage: "string");

  const testOutfitModel = OutfitModel(
      outfitName: "string",
      outfitImage: "string",
      grade: "string",
      outfitIcon: "string");
  const testRedeemCodeModel =
      RedeemCodeModel(code: "string", reward: "string", server: "string");

  const testStigmataModel = StigmataModel(
      stigmataName: "string",
      stigmataImage: "string",
      stigmataItems: [
        StigmataItemModel(
            star: "string",
            stigmataImage: "string",
            stigmataType: "string",
            stigmataEffects: [
              StigmataEffectModel(
                  titleEffect: "string", descriptionEffect: "string")
            ],
            stigmataPieceName: "string")
      ],
      setEffects: [
        SetEffectModel(setName: "string", description: "string")
      ]);

  const testTierListModel = TierListModel(
      valkyrieName: "string",
      image: "string",
      element: "string",
      role: "string",
      tier: "string");

  const testWeaponModel = WeaponModel(
      weaponName: "string",
      type: "string",
      rank: "string",
      urlImage: "string",
      skillWeapons: [
        SkillWeaponModel(titleSkill: "string", descriptionSkill: "string")
      ]);

  group("getRedeemCode", () {
    test('should return list of RedeemCodeModel when success get data',
        () async {
      when(dataSourceImpl.getRedeemCode()).thenAnswer(
        (_) async => <RedeemCodeModel>[testRedeemCodeModel],
      );
      final result = await dataSourceImpl.getRedeemCode();
      expect(result, equals(<RedeemCodeModel>[testRedeemCodeModel]));
    });
  });

  group("getEvent", () {
    test('should return list of EventModel when success get data', () async {
      when(dataSourceImpl.getEvent()).thenAnswer(
        (_) async => <EventModel>[testEventModel],
      );
      final result = await dataSourceImpl.getEvent();
      expect(result, equals(<EventModel>[testEventModel]));
    });
  });

  group("getNewsUpdate", () {
    test('should return list of NewsUpdateModel when success get data',
        () async {
      when(dataSourceImpl.getNewsUpdate()).thenAnswer(
        (_) async => <NewsUpdateModel>[testNewsUpdateModel],
      );
      final result = await dataSourceImpl.getNewsUpdate();
      expect(result, equals(<NewsUpdateModel>[testNewsUpdateModel]));
    });
  });

  group("getCharacterBanner", () {
    test('should return list of CharacterBannerModel when success get data',
        () async {
      when(dataSourceImpl.getCharacterBanner()).thenAnswer(
        (_) async => <CharacterBannerModel>[testCharacterBannerModel],
      );
      final result = await dataSourceImpl.getCharacterBanner();
      expect(result, equals(<CharacterBannerModel>[testCharacterBannerModel]));
    });
  });

  group("getElfBanner", () {
    test('should return list of ElfBannerModel when success get data',
        () async {
      when(dataSourceImpl.getElfBanner()).thenAnswer(
        (_) async => <ElfBannerModel>[testElfBannerModel],
      );
      final result = await dataSourceImpl.getElfBanner();
      expect(result, equals(<ElfBannerModel>[testElfBannerModel]));
    });
  });

  group("getEquipmentBanner", () {
    test('should return list of EquipmentBannerModel when success get data',
        () async {
      when(dataSourceImpl.getEquipmentBanner()).thenAnswer(
        (_) async => <EquipmentBannerModel>[testEquipmentBannerModel],
      );
      final result = await dataSourceImpl.getEquipmentBanner();
      expect(result, equals(<EquipmentBannerModel>[testEquipmentBannerModel]));
    });
  });

  group("getCharacter", () {
    test('should return list of CharacterModel when success get data',
        () async {
      when(dataSourceImpl.getCharacter()).thenAnswer(
        (_) async => <CharacterModel>[testCharacterModel],
      );
      final result = await dataSourceImpl.getCharacter();
      expect(result, equals(<CharacterModel>[testCharacterModel]));
    });
  });

  group("getElf", () {
    test('should return list of ElfModel when success get data', () async {
      when(dataSourceImpl.getElf()).thenAnswer(
        (_) async => <ElfModel>[testElfModel],
      );
      final result = await dataSourceImpl.getElf();
      expect(result, equals(<ElfModel>[testElfModel]));
    });
  });

  group("getChangelog", () {
    test('should return list of ChangelogModel when success get data',
        () async {
      when(dataSourceImpl.getChangelog())
          .thenAnswer((_) async => [testChangelogModel]);
      final result = await dataSourceImpl.getChangelog();
      expect(result, equals([testChangelogModel]));
    });
  });

  group("getGeneralGuide", () {
    test('should return list of GuideModel when success get data', () async {
      when(dataSourceImpl.getGeneralGuide())
          .thenAnswer((_) async => [testGuideModel]);
      final result = await dataSourceImpl.getGeneralGuide();
      expect(result, equals([testGuideModel]));
    });
  });

  group("getBeginnerGuide", () {
    test('should return list of GuideModel when success get data', () async {
      when(dataSourceImpl.getBeginnerGuide())
          .thenAnswer((_) async => [testGuideModel]);
      final result = await dataSourceImpl.getBeginnerGuide();
      expect(result, equals([testGuideModel]));
    });
  });

  group("getOutfit", () {
    test('should return list of OutfitModel when success get data', () async {
      when(dataSourceImpl.getOutfit())
          .thenAnswer((_) async => [testOutfitModel]);
      final result = await dataSourceImpl.getOutfit();
      expect(result, equals([testOutfitModel]));
    });
  });

  group("getStigmata", () {
    test('should return list of StigmataModel when success get data', () async {
      when(dataSourceImpl.getStigmata())
          .thenAnswer((_) async => [testStigmataModel]);
      final result = await dataSourceImpl.getStigmata();
      expect(result, equals([testStigmataModel]));
    });
  });

  group("getTierList", () {
    test('should return list of TierListModel when success get data', () async {
      when(dataSourceImpl.getTierList())
          .thenAnswer((_) async => [testTierListModel]);
      final result = await dataSourceImpl.getTierList();
      expect(result, equals([testTierListModel]));
    });
  });

  group("getWeapon", () {
    test('should return list of WeaponModel when success get data', () async {
      when(dataSourceImpl.getWeapon())
          .thenAnswer((_) async => [testWeaponModel]);
      final result = await dataSourceImpl.getWeapon();
      expect(result, equals([testWeaponModel]));
    });
  });
}

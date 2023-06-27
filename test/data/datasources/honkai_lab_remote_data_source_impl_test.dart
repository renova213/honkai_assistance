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

import 'honkai_lab_remote_data_source_impl_test.mocks.dart';

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

  group("getRedeemCodes", () {
    test('should return list of RedeemCodeModel when success get data',
        () async {
      when(dataSourceImpl.getRedeemCodes()).thenAnswer(
        (_) async => <RedeemCodeModel>[testRedeemCodeModel],
      );
      final redeemCodes = await dataSourceImpl.getRedeemCodes();
      expect(redeemCodes, equals(<RedeemCodeModel>[testRedeemCodeModel]));
    });
  });

  group("getEvent", () {
    test('should return list of EventModel when success get data', () async {
      when(dataSourceImpl.getEvents()).thenAnswer(
        (_) async => <EventModel>[testEventModel],
      );
      final events = await dataSourceImpl.getEvents();
      expect(events, equals(<EventModel>[testEventModel]));
    });
  });

  group("getNewsUpdate", () {
    test('should return list of NewsUpdateModel when success get data',
        () async {
      when(dataSourceImpl.getNewsUpdate()).thenAnswer(
        (_) async => <NewsUpdateModel>[testNewsUpdateModel],
      );
      final newsUpdates = await dataSourceImpl.getNewsUpdate();
      expect(newsUpdates, equals(<NewsUpdateModel>[testNewsUpdateModel]));
    });
  });

  group("getCharacterBanners", () {
    test('should return list of CharacterBannerModel when success get data',
        () async {
      when(dataSourceImpl.getCharacterBanners()).thenAnswer(
        (_) async => <CharacterBannerModel>[testCharacterBannerModel],
      );
      final characterBanners = await dataSourceImpl.getCharacterBanners();
      expect(characterBanners,
          equals(<CharacterBannerModel>[testCharacterBannerModel]));
    });
  });

  group("getElfBanners", () {
    test('should return list of ElfBannerModel when success get data',
        () async {
      when(dataSourceImpl.getElfBanners()).thenAnswer(
        (_) async => <ElfBannerModel>[testElfBannerModel],
      );
      final elfBanners = await dataSourceImpl.getElfBanners();
      expect(elfBanners, equals(<ElfBannerModel>[testElfBannerModel]));
    });
  });

  group("getEquipmentBanners", () {
    test('should return list of EquipmentBannerModel when success get data',
        () async {
      when(dataSourceImpl.getEquipmentBanners()).thenAnswer(
        (_) async => <EquipmentBannerModel>[testEquipmentBannerModel],
      );
      final equipmentBanners = await dataSourceImpl.getEquipmentBanners();
      expect(equipmentBanners,
          equals(<EquipmentBannerModel>[testEquipmentBannerModel]));
    });
  });

  group("getCharacters", () {
    test('should return list of CharacterModel when success get data',
        () async {
      when(dataSourceImpl.getCharacters()).thenAnswer(
        (_) async => <CharacterModel>[testCharacterModel],
      );
      final characters = await dataSourceImpl.getCharacters();
      expect(characters, equals(<CharacterModel>[testCharacterModel]));
    });
  });

  group("getElf", () {
    test('should return list of ElfModel when success get data', () async {
      when(dataSourceImpl.getElfs()).thenAnswer(
        (_) async => <ElfModel>[testElfModel],
      );
      final elfs = await dataSourceImpl.getElfs();
      expect(elfs, equals(<ElfModel>[testElfModel]));
    });
  });

  group("getChangelog", () {
    test('should return list of ChangelogModel when success get data',
        () async {
      when(dataSourceImpl.getChangelog())
          .thenAnswer((_) async => [testChangelogModel]);
      final changelogs = await dataSourceImpl.getChangelog();
      expect(changelogs, equals([testChangelogModel]));
    });
  });

  group("getGeneralGuides", () {
    test('should return list of GuideModel when success get data', () async {
      when(dataSourceImpl.getGeneralGuides())
          .thenAnswer((_) async => [testGuideModel]);
      final generalGuides = await dataSourceImpl.getGeneralGuides();
      expect(generalGuides, equals([testGuideModel]));
    });
  });

  group("getBeginnerGuides", () {
    test('should return list of GuideModel when success get data', () async {
      when(dataSourceImpl.getBeginnerGuides())
          .thenAnswer((_) async => [testGuideModel]);
      final generalGuides = await dataSourceImpl.getBeginnerGuides();
      expect(generalGuides, equals([testGuideModel]));
    });
  });

  group("getOutfits", () {
    test('should return list of OutfitModel when success get data', () async {
      when(dataSourceImpl.getOutfits())
          .thenAnswer((_) async => [testOutfitModel]);
      final outfits = await dataSourceImpl.getOutfits();
      expect(outfits, equals([testOutfitModel]));
    });
  });

  group("getStigmata", () {
    test('should return list of StigmataModel when success get data', () async {
      when(dataSourceImpl.getStigmata())
          .thenAnswer((_) async => [testStigmataModel]);
      final outfits = await dataSourceImpl.getStigmata();
      expect(outfits, equals([testStigmataModel]));
    });
  });

  group("getTierList", () {
    test('should return list of TierListModel when success get data', () async {
      when(dataSourceImpl.getTierList())
          .thenAnswer((_) async => [testTierListModel]);
      final outfits = await dataSourceImpl.getTierList();
      expect(outfits, equals([testTierListModel]));
    });
  });

  group("getWeapons", () {
    test('should return list of WeaponModel when success get data', () async {
      when(dataSourceImpl.getWeapons())
          .thenAnswer((_) async => [testWeaponModel]);
      final outfits = await dataSourceImpl.getWeapons();
      expect(outfits, equals([testWeaponModel]));
    });
  });
}

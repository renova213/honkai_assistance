import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_lab/data/datasources/honkai_lab_remote_data_sources.dart';
import 'package:honkai_lab/data/models/activecode_model.dart';
import 'package:honkai_lab/data/models/banner_character_model.dart';
import 'package:honkai_lab/data/models/changelog_model.dart';
import 'package:honkai_lab/data/models/character_model.dart';
import 'package:honkai_lab/data/models/elf_banner_model.dart';
import 'package:honkai_lab/data/models/event_honkai_model.dart';
import 'package:honkai_lab/data/models/latest_update_model.dart';
import 'package:honkai_lab/data/models/weapon_stigma_banner_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'honkai_lab_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([HonkaiLabRemoteDataSourceImpl])
void main() {
  final MockHonkaiLabRemoteDataSourceImpl dataSourceImpl =
      MockHonkaiLabRemoteDataSourceImpl();

  const ActiveCodeModel testActiveCodeModel = ActiveCodeModel(
      code: "code", reward: "reward", isActive: true, server: "server");
  const testEventHonkaiModel = EventHonkaiModel(
      title: "title",
      description: "description",
      urlImage: "urlImage",
      eventType: "eventType");
  const testLatestUpdateModel = LatestUpdateModel(
      urlWeb: "urlWeb",
      title: "title",
      description: "description",
      urlImage: "urlImage");
  const testBannerCharacterModel = BannerCharacterModel(
      urlImage: "urlImage", endDate: "endDate", nameCharacter: "nameCharacter");
  const testChangeLogModel = ChangelogModel(characterLog: <CharacterLogModel>[
    CharacterLogModel(
        nameCharacter: "nameCharacter",
        tierBefore: "tierBefore",
        tierCurrent: "tierCurrent",
        urlImage: "urlImage")
  ], date: "date");
  CharacterModel testCharacterModel = const CharacterModel(
      element: "element",
      image: "image",
      imageChibi: "imageChibi",
      nameCharacter: "nameCharacter",
      tier: "tier",
      elementImage: "elementImage",
      role: "role",
      detail: DetailModel(
          characterProfile: CharacterProfileModel(
              dateBirth: "dateBirth",
              battlesuitDetail: "battlesuitDetail",
              gender: "gender",
              organization: "organization",
              height: "height",
              birthplace: "birthplace",
              weight: "weight"),
          rankUpLevel: <RankUpLevelModel>[
            RankUpLevelModel(rankUp: "rankUp", description: "description")
          ],
          characterEquipment: CharacterEquipmentModel(
              stigmatas: <EquipmentStigmataCharacterModel>[
                EquipmentStigmataCharacterModel(
                    nameStigmata: "nameStigmata",
                    rank: "rank",
                    urlImage: "urlImage")
              ],
              weapons: <EquipmentWeaponCharacterModel>[
                EquipmentWeaponCharacterModel(
                    nameWeapon: "nameWeapon",
                    rank: "rank",
                    urlImage: "urlImage")
              ]),
          characterTeam: <CharacterTeamModel>[
            CharacterTeamModel(characterTeam: <CharacterTeamItemModel>[
              CharacterTeamItemModel(
                  nameCharacter: "nameCharacter", urlImage: "urlImage")
            ], nameTeam: "nameTeam")
          ],
          characterElysianRealm: CharacterElysianRealmModel(
              recommendedSetup:
                  RecommendedSetupModel(emblemSetup: <EmblemSetupModel>[
                EmblemSetupModel(contents1: "contents1", contents2: "contents2")
              ], setupSignet: <SetupSignetModel>[
                SetupSignetModel(contents1: "contents1", contents2: "contents2")
              ], supportSetup: <SupportSetupModel>[
                SupportSetupModel(
                    contents1: "contents1",
                    contents2: "contents2",
                    contents3: "contents3")
              ]),
              coreSignet: <CoreSignetModel>[
                CoreSignetModel(contents1: "contents1", contents2: "contents2")
              ],
              reinforcementSignet: <ReinforcementSignetModel>[
                ReinforcementSignetModel(
                    contents1: "contents1", contents2: "contents2")
              ])));
  const testElfBannerModel = ElfBannerModel(
      urlImage: "urlImage", endDate: "endDate", nameElf: "nameElf");
  const testWeaponStigmaBannerModel = WeaponStigmaBannerModel(
      urlImageWeapon: "urlImageWeapon",
      urlImageStigmata: "urlImageStigmata",
      endDate: "endDate",
      nameWeapon: "nameWeapon",
      nameStigmata: "nameStigmata");

  group("getActiveCodes", () {
    test('should return ActiveCode when success get data', () async {
      when(dataSourceImpl.getActiveCodes(any)).thenAnswer(
        (_) async => <ActiveCodeModel>[testActiveCodeModel],
      );
      final getActiveCode = await dataSourceImpl.getActiveCodes("redeem_code");
      expect(getActiveCode, equals(<ActiveCodeModel>[testActiveCodeModel]));
    });
  });

  group("getEventHonkai", () {
    test('should return getEventHonkai when success get data', () async {
      when(dataSourceImpl.getEventHonkai(any)).thenAnswer(
        (_) async => <EventHonkaiModel>[testEventHonkaiModel],
      );
      final getEventHonkai = await dataSourceImpl.getEventHonkai("event");
      expect(getEventHonkai, equals(<EventHonkaiModel>[testEventHonkaiModel]));
    });
  });
  group("getLatestUpdate", () {
    test('should return getLatestUpdate when success get data', () async {
      when(dataSourceImpl.getLastUpdate(any)).thenAnswer(
        (_) async => <LatestUpdateModel>[testLatestUpdateModel],
      );
      final getLatestUpdate = await dataSourceImpl.getLastUpdate("update");
      expect(
          getLatestUpdate, equals(<LatestUpdateModel>[testLatestUpdateModel]));
    });
  });
  group("getBannerCharacter", () {
    test('should return getBannerCharacter when success get data', () async {
      when(dataSourceImpl.getBannerCharacter(any)).thenAnswer(
        (_) async => <BannerCharacterModel>[testBannerCharacterModel],
      );
      final getBannerCharacter =
          await dataSourceImpl.getBannerCharacter("banner_character");
      expect(getBannerCharacter,
          equals(<BannerCharacterModel>[testBannerCharacterModel]));
    });
  });
  group("getElfBanner", () {
    test('should return getElfBanner when success get data', () async {
      when(dataSourceImpl.getElfBanner(any)).thenAnswer(
        (_) async => <ElfBannerModel>[testElfBannerModel],
      );
      final getElfBanner = await dataSourceImpl.getElfBanner("elf_banner");
      expect(getElfBanner, equals(<ElfBannerModel>[testElfBannerModel]));
    });
  });
  group("getWeaponStigmaBanner", () {
    test('should return getWeaponStigmaBanner when success get data', () async {
      when(dataSourceImpl.getWeaponStigmaBanner(any)).thenAnswer(
        (_) async => <WeaponStigmaBannerModel>[testWeaponStigmaBannerModel],
      );
      final getWeaponStigmaBanner =
          await dataSourceImpl.getWeaponStigmaBanner("weapon_stigma_banner");
      expect(getWeaponStigmaBanner,
          equals(<WeaponStigmaBannerModel>[testWeaponStigmaBannerModel]));
    });
  });
  group("getCharacter", () {
    test('should return getCharacter when success get data', () async {
      when(dataSourceImpl.getCharacter(any)).thenAnswer(
        (_) async => <CharacterModel>[testCharacterModel],
      );
      final getCharacter = await dataSourceImpl.getCharacter("character");
      expect(getCharacter, equals(<CharacterModel>[testCharacterModel]));
    });
  });
  group("getChangelog", () {
    test('should return getChangelog when success get data', () async {
      when(dataSourceImpl.getChangelog(any))
          .thenAnswer((_) async => testChangeLogModel);
      final getChangelog = await dataSourceImpl.getChangelog("changelog");
      expect(getChangelog, equals(testChangeLogModel));
    });
  });
}

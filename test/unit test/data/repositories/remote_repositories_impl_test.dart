import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_assistance/common/constant.dart';
import 'package:honkai_assistance/common/error/error.dart';
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
import 'package:honkai_assistance/data/repositories/remote_repository_impl.dart';
import 'package:honkai_assistance/domain/entities/changelog_entity.dart';
import 'package:honkai_assistance/domain/entities/character_banner_entity.dart';
import 'package:honkai_assistance/domain/entities/character_entity.dart';
import 'package:honkai_assistance/domain/entities/elf_banner_entity.dart';
import 'package:honkai_assistance/domain/entities/elf_entity.dart';
import 'package:honkai_assistance/domain/entities/equipment_banner_entity.dart';
import 'package:honkai_assistance/domain/entities/event_entity.dart';
import 'package:honkai_assistance/domain/entities/guide_entity.dart';
import 'package:honkai_assistance/domain/entities/news_update_entity.dart';
import 'package:honkai_assistance/domain/entities/outfit_entity.dart';
import 'package:honkai_assistance/domain/entities/redeem_code_entity.dart';
import 'package:honkai_assistance/domain/entities/stigmata_entity.dart';
import 'package:honkai_assistance/domain/entities/tier_list_entity.dart';
import 'package:honkai_assistance/domain/entities/weapon_entity.dart';
import 'package:honkai_assistance/domain/repositories/remote_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../datasources/remote_data_source_test.mocks.dart';

@GenerateMocks([RemoteRepository])
void main() {
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

  ///
  const ChangelogEntity testChangelogEntity = testChangelogModel;

  const CharacterBannerEntity testCharacterBannerEntity =
      testCharacterBannerModel;

  CharacterEntity testCharacterEntity = testCharacterModel;

  const ElfBannerEntity testElfBannerEntity = testElfBannerModel;

  const ElfEntity testElfEntity = testElfModel;

  const EquipmentBannerEntity testEquipmentBannerEntity =
      testEquipmentBannerModel;

  const EventEntity testEventEntity = testEventModel;

  const GuideEntity testGuideEntity = testGuideModel;

  const NewsUpdateEntity testNewsUpdateEntity = testNewsUpdateModel;

  const OutfitEntity testOutfitEntity = testOutfitModel;

  const RedeemCodeEntity testRedeemCodeEntity = testRedeemCodeModel;

  const StigmataEntity testStigmataEntity = testStigmataModel;

  const TierListEntity testTierListEntity = testTierListModel;

  const WeaponEntity testWeaponEntity = testWeaponModel;

  MockRemoteDataSourceImpl mockRemoteDataSource = MockRemoteDataSourceImpl();
  RemoteRepository mockRepository =
      RemoteRepositoryImpl(remoteDataSource: mockRemoteDataSource);

  group("getRedeemCodes", () {
    test(
        'Should return remote data when the call to remote data is successfull',
        () async {
      when(mockRemoteDataSource.getRedeemCode())
          .thenAnswer((_) async => [testRedeemCodeModel]);

      final result = await mockRepository.getRedeemCode();

      verify(mockRemoteDataSource.getRedeemCode());

      final redeemCodes =
          result.fold((failure) => null, (redeemCodes) => redeemCodes);

      expect(redeemCodes, equals(<RedeemCodeEntity>[testRedeemCodeEntity]));
    });

    test(
        'should return server failure when the call to remote data is unsuccessfull',
        () async {
      when(mockRemoteDataSource.getRedeemCode())
          .thenThrow(const SocketException(internetError));

      final result = await mockRepository.getRedeemCode();

      verify(mockRemoteDataSource.getRedeemCode());

      expect(
          result,
          equals(
            const Left(InternetFailure(message: internetError)),
          ));
    });
  });
  group("getEvent", () {
    test(
        'Should return remote data when the call to remote data is successfull',
        () async {
      when(mockRemoteDataSource.getEvent())
          .thenAnswer((_) async => [testEventModel]);

      final results = await mockRepository.getEvent();

      verify(mockRemoteDataSource.getEvent());

      final events = results.fold((failure) => null, (events) => events);

      expect(events, equals(<EventEntity>[testEventEntity]));
    });

    test(
        'should return server failure when the call to remote data is unsuccessfull',
        () async {
      when(mockRemoteDataSource.getEvent())
          .thenThrow(const SocketException(internetError));

      final results = await mockRepository.getEvent();

      verify(mockRemoteDataSource.getEvent());

      expect(
          results,
          equals(
            const Left(InternetFailure(message: internetError)),
          ));
    });
  });
  group("getNewsUpdate", () {
    test(
        'Should return remote data when the call to remote data is successfull',
        () async {
      when(mockRemoteDataSource.getNewsUpdate())
          .thenAnswer((_) async => [testNewsUpdateModel]);

      final results = await mockRepository.getNewsUpdate();

      verify(mockRemoteDataSource.getNewsUpdate());

      final newsUpdates =
          results.fold((failure) => null, (newsUpdates) => newsUpdates);

      expect(newsUpdates, equals(<NewsUpdateEntity>[testNewsUpdateEntity]));
    });

    test(
        'should return server failure when the call to remote data is unsuccessfull',
        () async {
      when(mockRemoteDataSource.getNewsUpdate())
          .thenThrow(const SocketException(internetError));

      final results = await mockRepository.getNewsUpdate();

      verify(mockRemoteDataSource.getNewsUpdate());

      expect(
          results,
          equals(
            const Left(InternetFailure(message: internetError)),
          ));
    });
  });
  group("getCharacterBanner", () {
    test(
        'Should return remote data when the call to remote data is successfull',
        () async {
      when(mockRemoteDataSource.getCharacterBanner())
          .thenAnswer((_) async => [testCharacterBannerModel]);

      final results = await mockRepository.getCharacterBanner();

      verify(mockRemoteDataSource.getCharacterBanner());

      final characterBanners = results.fold(
          (failure) => null, (characterBanners) => characterBanners);

      expect(characterBanners,
          equals(<CharacterBannerEntity>[testCharacterBannerEntity]));
    });

    test(
        'should return server failure when the call to remote data is unsuccessfull',
        () async {
      when(mockRemoteDataSource.getCharacterBanner())
          .thenThrow(const SocketException(internetError));

      final results = await mockRepository.getCharacterBanner();

      verify(mockRemoteDataSource.getCharacterBanner());

      expect(
          results,
          equals(
            const Left(InternetFailure(message: internetError)),
          ));
    });
  });
  group("getElfBanner", () {
    test(
        'Should return remote data when the call to remote data is successfull',
        () async {
      when(mockRemoteDataSource.getElfBanner())
          .thenAnswer((_) async => [testElfBannerModel]);

      final results = await mockRepository.getElfBanner();

      verify(mockRemoteDataSource.getElfBanner());

      final elfBanners =
          results.fold((failure) => null, (elfBanners) => elfBanners);

      expect(elfBanners, equals(<ElfBannerEntity>[testElfBannerEntity]));
    });

    test(
        'should return server failure when the call to remote data is unsuccessfull',
        () async {
      when(mockRemoteDataSource.getElfBanner())
          .thenThrow(const SocketException(internetError));

      final results = await mockRepository.getElfBanner();

      verify(mockRemoteDataSource.getElfBanner());

      expect(
          results,
          equals(
            const Left(InternetFailure(message: internetError)),
          ));
    });
  });
  group("getEquipmentBanner", () {
    test(
        'Should return remote data when the call to remote data is successfull',
        () async {
      when(mockRemoteDataSource.getEquipmentBanner())
          .thenAnswer((_) async => [testEquipmentBannerModel]);

      final results = await mockRepository.getEquipmentBanner();

      verify(mockRemoteDataSource.getEquipmentBanner());

      final equipmentBanners = results.fold(
          (failure) => null, (equipmentBanners) => equipmentBanners);

      expect(equipmentBanners,
          equals(<EquipmentBannerEntity>[testEquipmentBannerEntity]));
    });

    test(
        'should return server failure when the call to remote data is unsuccessfull',
        () async {
      when(mockRemoteDataSource.getEquipmentBanner())
          .thenThrow(const SocketException(internetError));

      final results = await mockRepository.getEquipmentBanner();

      verify(mockRemoteDataSource.getEquipmentBanner());

      expect(
          results,
          equals(
            const Left(InternetFailure(message: internetError)),
          ));
    });
  });
  group("getCharacter", () {
    test(
        'Should return remote data when the call to remote data is successfull',
        () async {
      when(mockRemoteDataSource.getCharacter())
          .thenAnswer((_) async => [testCharacterModel]);

      final results = await mockRepository.getCharacter();

      verify(mockRemoteDataSource.getCharacter());

      final characters =
          results.fold((failure) => null, (characters) => characters);

      expect(characters, equals(<CharacterEntity>[testCharacterEntity]));
    });

    test(
        'should return server failure when the call to remote data is unsuccessfull',
        () async {
      when(mockRemoteDataSource.getCharacter())
          .thenThrow(const SocketException(internetError));

      final results = await mockRepository.getCharacter();

      verify(mockRemoteDataSource.getCharacter());

      expect(
          results,
          equals(
            const Left(InternetFailure(message: internetError)),
          ));
    });
  });
  group("getElf", () {
    test(
        'Should return remote data when the call to remote data is successfull',
        () async {
      when(mockRemoteDataSource.getElf())
          .thenAnswer((_) async => [testElfModel]);

      final results = await mockRepository.getElf();

      verify(mockRemoteDataSource.getElf());

      final elfs = results.fold((failure) => null, (elfs) => elfs);

      expect(elfs, equals(<ElfEntity>[testElfEntity]));
    });

    test(
        'should return server failure when the call to remote data is unsuccessfull',
        () async {
      when(mockRemoteDataSource.getElf())
          .thenThrow(const SocketException(internetError));

      final results = await mockRepository.getElf();

      verify(mockRemoteDataSource.getElf());

      expect(
          results,
          equals(
            const Left(InternetFailure(message: internetError)),
          ));
    });
  });
  group("getChangelog", () {
    test(
        'Should return remote data when the call to remote data is successfull',
        () async {
      when(mockRemoteDataSource.getChangelog())
          .thenAnswer((_) async => [testChangelogModel]);

      final results = await mockRepository.getChangelog();

      verify(mockRemoteDataSource.getChangelog());

      final changelogs =
          results.fold((failure) => null, (changelogs) => changelogs);

      expect(changelogs, equals(<ChangelogEntity>[testChangelogEntity]));
    });

    test(
        'should return server failure when the call to remote data is unsuccessfull',
        () async {
      when(mockRemoteDataSource.getChangelog())
          .thenThrow(const SocketException(internetError));

      final results = await mockRepository.getChangelog();

      verify(mockRemoteDataSource.getChangelog());

      expect(
          results,
          equals(
            const Left(InternetFailure(message: internetError)),
          ));
    });
  });
  group("getGeneralGuide", () {
    test(
        'Should return remote data when the call to remote data is successfull',
        () async {
      when(mockRemoteDataSource.getGeneralGuide())
          .thenAnswer((_) async => [testGuideModel]);

      final results = await mockRepository.getGeneralGuide();

      verify(mockRemoteDataSource.getGeneralGuide());

      final generalGuides =
          results.fold((failure) => null, (generalGuides) => generalGuides);

      expect(generalGuides, equals(<GuideEntity>[testGuideEntity]));
    });

    test(
        'should return server failure when the call to remote data is unsuccessfull',
        () async {
      when(mockRemoteDataSource.getGeneralGuide())
          .thenThrow(const SocketException(internetError));

      final results = await mockRepository.getGeneralGuide();

      verify(mockRemoteDataSource.getGeneralGuide());

      expect(
          results,
          equals(
            const Left(InternetFailure(message: internetError)),
          ));
    });
  });
  group("getBeginnerGuide", () {
    test(
        'Should return remote data when the call to remote data is successfull',
        () async {
      when(mockRemoteDataSource.getBeginnerGuide())
          .thenAnswer((_) async => [testGuideModel]);

      final results = await mockRepository.getBeginnerGuide();

      verify(mockRemoteDataSource.getBeginnerGuide());

      final benginnerGuides =
          results.fold((failure) => null, (benginnerGuides) => benginnerGuides);

      expect(benginnerGuides, equals(<GuideEntity>[testGuideEntity]));
    });

    test(
        'should return server failure when the call to remote data is unsuccessfull',
        () async {
      when(mockRemoteDataSource.getBeginnerGuide())
          .thenThrow(const SocketException(internetError));

      final results = await mockRepository.getBeginnerGuide();

      verify(mockRemoteDataSource.getBeginnerGuide());

      expect(
          results,
          equals(
            const Left(InternetFailure(message: internetError)),
          ));
    });
  });
  group("getOutfit", () {
    test(
        'Should return remote data when the call to remote data is successfull',
        () async {
      when(mockRemoteDataSource.getOutfit())
          .thenAnswer((_) async => [testOutfitModel]);

      final results = await mockRepository.getOutfit();

      verify(mockRemoteDataSource.getOutfit());

      final outfits = results.fold((failure) => null, (outfits) => outfits);

      expect(outfits, equals(<OutfitEntity>[testOutfitEntity]));
    });

    test(
        'should return server failure when the call to remote data is unsuccessfull',
        () async {
      when(mockRemoteDataSource.getOutfit())
          .thenThrow(const SocketException(internetError));

      final results = await mockRepository.getOutfit();

      verify(mockRemoteDataSource.getOutfit());

      expect(
          results,
          equals(
            const Left(InternetFailure(message: internetError)),
          ));
    });
  });
  group("getStigmata", () {
    test(
        'Should return remote data when the call to remote data is successfull',
        () async {
      when(mockRemoteDataSource.getStigmata())
          .thenAnswer((_) async => [testStigmataModel]);

      final results = await mockRepository.getStigmata();

      verify(mockRemoteDataSource.getStigmata());

      final stigmatas =
          results.fold((failure) => null, (stigmatas) => stigmatas);

      expect(stigmatas, equals(<StigmataEntity>[testStigmataEntity]));
    });

    test(
        'should return server failure when the call to remote data is unsuccessfull',
        () async {
      when(mockRemoteDataSource.getStigmata())
          .thenThrow(const SocketException(internetError));

      final results = await mockRepository.getStigmata();

      verify(mockRemoteDataSource.getStigmata());

      expect(
          results,
          equals(
            const Left(InternetFailure(message: internetError)),
          ));
    });
  });
  group("getTierList", () {
    test(
        'Should return remote data when the call to remote data is successfull',
        () async {
      when(mockRemoteDataSource.getTierList())
          .thenAnswer((_) async => [testTierListModel]);

      final results = await mockRepository.getTierList();

      verify(mockRemoteDataSource.getTierList());

      final tierLists =
          results.fold((failure) => null, (tierLists) => tierLists);

      expect(tierLists, equals(<TierListEntity>[testTierListEntity]));
    });

    test(
        'should return server failure when the call to remote data is unsuccessfull',
        () async {
      when(mockRemoteDataSource.getTierList())
          .thenThrow(const SocketException(internetError));

      final results = await mockRepository.getTierList();

      verify(mockRemoteDataSource.getTierList());

      expect(
          results,
          equals(
            const Left(InternetFailure(message: internetError)),
          ));
    });
  });
  group("getWeapon", () {
    test(
        'Should return remote data when the call to remote data is successfull',
        () async {
      when(mockRemoteDataSource.getWeapon())
          .thenAnswer((_) async => [testWeaponModel]);

      final results = await mockRepository.getWeapon();

      verify(mockRemoteDataSource.getWeapon());

      final weapons = results.fold((failure) => null, (weapons) => weapons);

      expect(weapons, equals(<WeaponEntity>[testWeaponEntity]));
    });

    test(
        'should return server failure when the call to remote data is unsuccessfull',
        () async {
      when(mockRemoteDataSource.getWeapon())
          .thenThrow(const SocketException(internetError));

      final results = await mockRepository.getWeapon();

      verify(mockRemoteDataSource.getWeapon());

      expect(
          results,
          equals(
            const Left(InternetFailure(message: internetError)),
          ));
    });
  });
}

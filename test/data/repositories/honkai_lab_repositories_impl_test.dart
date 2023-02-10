// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:honkai_lab/data/datasources/honkai_lab_remote_data_sources.dart';
// import 'package:honkai_lab/data/models/activecode_model.dart';
// import 'package:honkai_lab/data/models/banner_character_model.dart';
// import 'package:honkai_lab/data/models/changelog_model.dart';
// import 'package:honkai_lab/data/models/character_model.dart';
// import 'package:honkai_lab/data/models/elf_banner_model.dart';
// import 'package:honkai_lab/data/models/event_honkai_model.dart';
// import 'package:honkai_lab/data/models/latest_update_model.dart';
// import 'package:honkai_lab/data/models/weapon_stigma_banner_model.dart';
// import 'package:honkai_lab/data/repositories/honkai_lab_repositories_impl.dart';
// import 'package:honkai_lab/domain/entities/active_code.dart';
// import 'package:honkai_lab/domain/entities/banner_character.dart';
// import 'package:honkai_lab/domain/entities/changelog.dart';
// import 'package:honkai_lab/domain/entities/character.dart';
// import 'package:honkai_lab/domain/entities/elf_banner.dart';
// import 'package:honkai_lab/domain/entities/event_honkai.dart';
// import 'package:honkai_lab/domain/entities/latest_update.dart';
// import 'package:honkai_lab/domain/entities/weapon_stigmata_banner.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';

// import 'honkai_lab_repositories_impl_test.mocks.dart';

// @GenerateMocks([HonkaiLabRemoteDataSource])
// void main() {
//   const String collectionName = "collectionName";

//   const ActiveCodeModel testActiveCodeModel = ActiveCodeModel(
//       code: "code", reward: "reward", isActive: true, server: "server");
//   const testEventHonkaiModel = EventHonkaiModel(
//       title: "title",
//       description: "description",
//       urlImage: "urlImage",
//       eventType: "eventType");
//   const testLatestUpdateModel = LatestUpdateModel(
//       urlWeb: "urlWeb",
//       title: "title",
//       description: "description",
//       urlImage: "urlImage");
//   const testBannerCharacterModel = BannerCharacterModel(
//       urlImage: "urlImage", endDate: "endDate", nameCharacter: "nameCharacter");
//   const testChangeLogModel = ChangelogModel(characterLog: <CharacterLogModel>[
//     CharacterLogModel(
//         nameCharacter: "nameCharacter",
//         tierBefore: "tierBefore",
//         tierCurrent: "tierCurrent",
//         urlImage: "urlImage")
//   ], date: "date");
//   CharacterModel testCharacterModel = const CharacterModel(
//       element: "element",
//       image: "image",
//       imageChibi: "imageChibi",
//       nameCharacter: "nameCharacter",
//       tier: "tier",
//       elementImage: "elementImage",
//       role: "role",
//       detail: DetailModel(
//           characterProfile: CharacterProfileModel(
//               dateBirth: "dateBirth",
//               battlesuitDetail: "battlesuitDetail",
//               gender: "gender",
//               organization: "organization",
//               height: "height",
//               birthplace: "birthplace",
//               weight: "weight"),
//           rankUpLevel: <RankUpLevelModel>[
//             RankUpLevelModel(rankUp: "rankUp", description: "description")
//           ],
//           characterEquipment: CharacterEquipmentModel(
//               stigmatas: <EquipmentStigmataCharacterModel>[
//                 EquipmentStigmataCharacterModel(
//                     nameStigmata: "nameStigmata",
//                     rank: "rank",
//                     urlImage: "urlImage")
//               ],
//               weapons: <EquipmentWeaponCharacterModel>[
//                 EquipmentWeaponCharacterModel(
//                     nameWeapon: "nameWeapon",
//                     rank: "rank",
//                     urlImage: "urlImage")
//               ]),
//           characterTeam: <CharacterTeamModel>[
//             CharacterTeamModel(characterTeam: <CharacterTeamItemModel>[
//               CharacterTeamItemModel(
//                   nameCharacter: "nameCharacter", urlImage: "urlImage")
//             ], nameTeam: "nameTeam")
//           ],
//           characterElysianRealm: CharacterElysianRealmModel(
//               recommendedSetup:
//                   RecommendedSetupModel(emblemSetup: <EmblemSetupModel>[
//                 EmblemSetupModel(contents1: "contents1", contents2: "contents2")
//               ], setupSignet: <SetupSignetModel>[
//                 SetupSignetModel(contents1: "contents1", contents2: "contents2")
//               ], supportSetup: <SupportSetupModel>[
//                 SupportSetupModel(
//                     contents1: "contents1",
//                     contents2: "contents2",
//                     contents3: "contents3")
//               ]),
//               coreSignet: <CoreSignetModel>[
//                 CoreSignetModel(contents1: "contents1", contents2: "contents2")
//               ],
//               reinforcementSignet: <ReinforcementSignetModel>[
//                 ReinforcementSignetModel(
//                     contents1: "contents1", contents2: "contents2")
//               ])));
//   const testElfBannerModel = ElfBannerModel(
//       urlImage: "urlImage", endDate: "endDate", nameElf: "nameElf");
//   const testWeaponStigmaBannerModel = WeaponStigmaBannerModel(
//       urlImageWeapon: "urlImageWeapon",
//       urlImageStigmata: "urlImageStigmata",
//       endDate: "endDate",
//       nameWeapon: "nameWeapon",
//       nameStigmata: "nameStigmata");

//   const ActiveCode testActiveCode = testActiveCodeModel;
//   const EventHonkai testEventHonkai = testEventHonkaiModel;
//   const LatestUpdate testLatestUpdate = testLatestUpdateModel;
//   const BannerCharacter testBannerCharacter = testBannerCharacterModel;
//   const ElfBanner testElfBanner = testElfBannerModel;
//   const WeaponStigmataBanner testWeaponStigmataBanner =
//       testWeaponStigmaBannerModel;
//   Character testCharacter = testCharacterModel;
//   const Changelog testChangelog = testChangeLogModel;

//   MockHonkaiLabRemoteDataSource remoteDataSource =
//       MockHonkaiLabRemoteDataSource();
//   HonkaiLabRepositoriesImpl repository =
//       HonkaiLabRepositoriesImpl(remoteDataSource: remoteDataSource);

//   group("getActiveCodes", () {
//     test(
//         'Should return remote data when the call to remote data is successfull',
//         () async {
//       when(remoteDataSource.getActiveCodes(collectionName))
//           .thenAnswer((_) async => [testActiveCodeModel]);

//       final result = await repository.getActiveCodes(collectionName);

//       verify(remoteDataSource.getActiveCodes(collectionName));

//       final activeCode =
//           result.fold((failure) => null, (activeCode) => activeCode);

//       expect(activeCode, equals(<ActiveCode>[testActiveCode]));
//     });

//     test(
//         'should return server failure when the call to remote data is unsuccessfull',
//         () async {
//       when(remoteDataSource.getActiveCodes(any)).thenThrow(ServerException());

//       final result = await repository.getActiveCodes(collectionName);

//       verify(remoteDataSource.getActiveCodes(collectionName));

//       expect(
//           result,
//           equals(
//             const Left(
//               ServerFailure(message: "can't connect to server"),
//             ),
//           ));
//     });
//   });

//   group("getEventHonkai", () {
//     test(
//         'Should return remote data when the call to remote data is successfull',
//         () async {
//       when(remoteDataSource.getEventHonkai(collectionName))
//           .thenAnswer((_) async => [testEventHonkaiModel]);

//       final result = await repository.getEventHonkai(collectionName);

//       verify(remoteDataSource.getEventHonkai(collectionName));

//       final eventHonkai =
//           result.fold((failure) => null, (eventHonkai) => eventHonkai);

//       expect(eventHonkai, equals(<EventHonkai>[testEventHonkai]));
//     });

//     test(
//         'should return server failure when the call to remote data is unsuccessfull',
//         () async {
//       when(remoteDataSource.getEventHonkai(any)).thenThrow(ServerException());

//       final result = await repository.getEventHonkai(collectionName);

//       verify(remoteDataSource.getEventHonkai(collectionName));

//       expect(
//           result,
//           equals(
//             const Left(
//               ServerFailure(message: "can't connect to server"),
//             ),
//           ));
//     });
//   });

//   group("getLatestUpdate", () {
//     test(
//         'Should return remote data when the call to remote data is successfull',
//         () async {
//       when(remoteDataSource.getLastUpdate(collectionName))
//           .thenAnswer((_) async => [testLatestUpdateModel]);

//       final result = await repository.getLatestUpdate(collectionName);

//       verify(remoteDataSource.getLastUpdate(collectionName));

//       final latestUpdate =
//           result.fold((failure) => null, (latestUpdate) => latestUpdate);

//       expect(latestUpdate, equals(<LatestUpdate>[testLatestUpdate]));
//     });

//     test(
//         'should return server failure when the call to remote data is unsuccessfull',
//         () async {
//       when(remoteDataSource.getLastUpdate(any)).thenThrow(ServerException());

//       final result = await repository.getLatestUpdate(collectionName);

//       verify(remoteDataSource.getLastUpdate(collectionName));

//       expect(
//           result,
//           equals(
//             const Left(
//               ServerFailure(message: "can't connect to server"),
//             ),
//           ));
//     });
//   });

//   group("getBannerCharacter", () {
//     test(
//         'Should return remote data when the call to remote data is successfull',
//         () async {
//       when(remoteDataSource.getBannerCharacter(collectionName))
//           .thenAnswer((_) async => [testBannerCharacterModel]);

//       final result = await repository.getBannerCharacter(collectionName);

//       verify(remoteDataSource.getBannerCharacter(collectionName));

//       final bannerCharacter =
//           result.fold((failure) => null, (bannerCharacter) => bannerCharacter);

//       expect(bannerCharacter, equals(<BannerCharacter>[testBannerCharacter]));
//     });

//     test(
//         'should return server failure when the call to remote data is unsuccessfull',
//         () async {
//       when(remoteDataSource.getBannerCharacter(any))
//           .thenThrow(ServerException());

//       final result = await repository.getBannerCharacter(collectionName);

//       verify(remoteDataSource.getBannerCharacter(collectionName));

//       expect(
//           result,
//           equals(
//             const Left(
//               ServerFailure(message: "can't connect to server"),
//             ),
//           ));
//     });
//   });

//   group("getElfBanner", () {
//     test(
//         'Should return remote data when the call to remote data is successfull',
//         () async {
//       when(remoteDataSource.getElfBanner(collectionName))
//           .thenAnswer((_) async => [testElfBannerModel]);

//       final result = await repository.getElfBanner(collectionName);

//       verify(remoteDataSource.getElfBanner(collectionName));

//       final elfBanner =
//           result.fold((failure) => null, (elfBanner) => elfBanner);

//       expect(elfBanner, equals(<ElfBanner>[testElfBanner]));
//     });

//     test(
//         'should return server failure when the call to remote data is unsuccessfull',
//         () async {
//       when(remoteDataSource.getElfBanner(any)).thenThrow(ServerException());

//       final result = await repository.getElfBanner(collectionName);

//       verify(remoteDataSource.getElfBanner(collectionName));

//       expect(
//           result,
//           equals(
//             const Left(
//               ServerFailure(message: "can't connect to server"),
//             ),
//           ));
//     });
//   });

//   group("getWeaponStigmaBanner", () {
//     test(
//         'Should return remote data when the call to remote data is successfull',
//         () async {
//       when(remoteDataSource.getWeaponStigmaBanner(collectionName))
//           .thenAnswer((_) async => [testWeaponStigmaBannerModel]);

//       final result = await repository.getWeaponStigmaBanner(collectionName);

//       verify(remoteDataSource.getWeaponStigmaBanner(collectionName));

//       final weaponStigmataBanner = result.fold(
//           (failure) => null, (weaponStigmataBanner) => weaponStigmataBanner);

//       expect(weaponStigmataBanner,
//           equals(<WeaponStigmataBanner>[testWeaponStigmataBanner]));
//     });

//     test(
//         'should return server failure when the call to remote data is unsuccessfull',
//         () async {
//       when(remoteDataSource.getWeaponStigmaBanner(any))
//           .thenThrow(ServerException());

//       final result = await repository.getWeaponStigmaBanner(collectionName);

//       verify(remoteDataSource.getWeaponStigmaBanner(collectionName));

//       expect(
//           result,
//           equals(
//             const Left(
//               ServerFailure(message: "can't connect to server"),
//             ),
//           ));
//     });
//   });

//   group("getCharacter", () {
//     test(
//         'Should return remote data when the call to remote data is successfull',
//         () async {
//       when(remoteDataSource.getCharacter(collectionName))
//           .thenAnswer((_) async => [testCharacterModel]);

//       final result = await repository.getCharacter(collectionName, "character");

//       verify(remoteDataSource.getCharacter(collectionName));

//       final character =
//           result.fold((failure) => null, (character) => character);

//       expect(character, equals(<Character>[testCharacter]));
//     });

//     test(
//         'should return server failure when the call to remote data is unsuccessfull',
//         () async {
//       when(remoteDataSource.getCharacter(any)).thenThrow(ServerException());

//       final result = await repository.getCharacter(collectionName, "character");

//       verify(remoteDataSource.getCharacter(collectionName));

//       expect(
//           result,
//           equals(
//             const Left(
//               ServerFailure(message: "can't connect to server"),
//             ),
//           ));
//     });
//   });

//   group("getChangelog", () {
//     test(
//         'Should return remote data when the call to remote data is successfull',
//         () async {
//       when(remoteDataSource.getChangelog(collectionName))
//           .thenAnswer((_) async => testChangeLogModel);

//       final result = await repository.getChangelog(collectionName);

//       verify(remoteDataSource.getChangelog(collectionName));

//       final changelog =
//           result.fold((failure) => null, (changelog) => changelog);

//       expect(changelog, equals(testChangelog));
//     });

//     test(
//         'should return server failure when the call to remote data is unsuccessfull',
//         () async {
//       when(remoteDataSource.getChangelog(any)).thenThrow(ServerException());

//       final result = await repository.getChangelog(collectionName);

//       verify(remoteDataSource.getChangelog(collectionName));

//       expect(
//           result,
//           equals(
//             const Left(
//               ServerFailure(message: "can't connect to server"),
//             ),
//           ));
//     });
//   });
// }

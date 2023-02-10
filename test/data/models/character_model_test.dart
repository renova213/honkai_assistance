// import 'dart:convert';

// import 'package:flutter_test/flutter_test.dart';
// import 'package:honkai_lab/data/models/character_model.dart';
// import 'package:honkai_lab/domain/entities/character.dart';

// import '../../fixtures/fixture_reader.dart';

// void main() {
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

//   test('should be a subclass of Character entity', () {
//     expect(testCharacterModel, isA<Character>());
//   });

//   group('fromJson', () {
//     test('should return valid model CharacterModel from json', () {
//       final List jsonMap = json.decode(
//         fixture('character.json'),
//       );

//       final result = CharacterModel.fromMap(jsonMap.first);
//       expect(result, testCharacterModel);
//     });
//   });
// }

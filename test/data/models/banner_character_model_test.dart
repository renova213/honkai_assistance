// import 'dart:convert';

// import 'package:flutter_test/flutter_test.dart';
// import 'package:honkai_lab/data/models/banner_character_model.dart';
// import 'package:honkai_lab/domain/entities/banner_character.dart';

// import '../../fixtures/fixture_reader.dart';

// void main() {
//   const testBannerCharacterModel = BannerCharacterModel(
//       urlImage: "urlImage", endDate: "endDate", nameCharacter: "nameCharacter");

//   test('should be a subclass of BannerCharacter entity', () {
//     expect(testBannerCharacterModel, isA<BannerCharacter>());
//   });

//   group('fromJson', () {
//     test('should return valid model BannerCharacterModel from json', () {
//       final List jsonMap = json.decode(
//         fixture('banner_character.json'),
//       );

//       final result = BannerCharacterModel.fromMap(jsonMap.first);
//       expect(result, testBannerCharacterModel);
//     });
//   });
// }

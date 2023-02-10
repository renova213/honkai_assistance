// import 'dart:convert';

// import 'package:flutter_test/flutter_test.dart';
// import 'package:honkai_lab/data/models/weapon_stigma_banner_model.dart';
// import 'package:honkai_lab/domain/entities/weapon_stigmata_banner.dart';

// import '../../fixtures/fixture_reader.dart';

// void main() {
//   const testWeaponStigmaBannerModel = WeaponStigmaBannerModel(
//       urlImageWeapon: "urlImageWeapon",
//       urlImageStigmata: "urlImageStigmata",
//       endDate: "endDate",
//       nameWeapon: "nameWeapon",
//       nameStigmata: "nameStigmata");
//   test('should be a subclass of WeaponStigmataBanner entity', () {
//     expect(testWeaponStigmaBannerModel, isA<WeaponStigmataBanner>());
//   });

//   group('fromJson', () {
//     test('should return valid model WeaponStigmaBannerModel from json', () {
//       final List jsonMap = json.decode(
//         fixture('weapon_stigmata_banner.json'),
//       );

//       final result = WeaponStigmaBannerModel.fromMap(jsonMap.first);
//       expect(result, testWeaponStigmaBannerModel);
//     });
//   });
// }

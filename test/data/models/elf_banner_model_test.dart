// import 'dart:convert';

// import 'package:flutter_test/flutter_test.dart';
// import 'package:honkai_lab/data/models/elf_banner_model.dart';
// import 'package:honkai_lab/domain/entities/elf_banner.dart';

// import '../../fixtures/fixture_reader.dart';

// void main() {
//   const testElfBannerModel = ElfBannerModel(
//       urlImage: "urlImage", endDate: "endDate", nameElf: "nameElf");

//   test('should be a subclass of ElfBanner entity', () {
//     expect(testElfBannerModel, isA<ElfBanner>());
//   });

//   group('fromJson', () {
//     test('should return valid model ElfBannerModel from json', () {
//       final List jsonMap = json.decode(
//         fixture('elf_banner.json'),
//       );

//       final result = ElfBannerModel.fromMap(jsonMap.first);
//       expect(result, testElfBannerModel);
//     });
//   });
// }

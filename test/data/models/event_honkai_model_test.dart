// import 'dart:convert';

// import 'package:flutter_test/flutter_test.dart';
// import 'package:honkai_lab/data/models/event_honkai_model.dart';
// import 'package:honkai_lab/domain/entities/event_honkai.dart';

// import '../../fixtures/fixture_reader.dart';

// void main() {
//   const testEventHonkaiModel = EventHonkaiModel(
//       title: "title",
//       description: "description",
//       urlImage: "urlImage",
//       eventType: "eventType");

//   test('should be a subclass of EventHonkai entity', () {
//     expect(testEventHonkaiModel, isA<EventHonkai>());
//   });

//   group('fromJson', () {
//     test('should return valid model EventHonkaiModel from json', () {
//       final List jsonMap = json.decode(
//         fixture('event_honkai.json'),
//       );

//       final result = EventHonkaiModel.fromMap(jsonMap.first);
//       expect(result, testEventHonkaiModel);
//     });
//   });
// }

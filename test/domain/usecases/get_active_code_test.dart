// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// @GenerateMocks([HonkaiLabRepositories])
// void main() {
//   MockHonkaiLabRepositories repositories = MockHonkaiLabRepositories();
//   GetActiveCodes usecase = GetActiveCodes(repositories: repositories);

//   const String collectionName = "collectionName";

//   const ActiveCode testActiveCode = ActiveCode(
//       code: "code", reward: "reward", isActive: true, server: "server");

//   test('should get ActiveCode from the repository', () async {
//     when(repositories.getActiveCodes(any))
//         .thenAnswer((_) async => const Right([testActiveCode]));

//     final result = await usecase(collectionName);

//     verify(repositories.getActiveCodes(collectionName));

//     expect(result, const Right([testActiveCode]));
//   });
// }

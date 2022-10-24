import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_lab/domain/entities/last_update.dart';
import 'package:honkai_lab/domain/repositories/honkai_lab_repositories.dart';
import 'package:honkai_lab/domain/usecases/get_last_update.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_active_code_test.mocks.dart';

@GenerateMocks([HonkaiLabRepositories])
void main() {
  MockHonkaiLabRepositories repositories = MockHonkaiLabRepositories();
  GetLatestUpdate usecase = GetLatestUpdate(repositories: repositories);

  const String collectionName = "collectionName";

  const testLatestUpdate = LatestUpdate(
      urlWeb: "urlWeb",
      title: "title",
      description: "description",
      urlImage: "urlImage");

  test('should get LatestUpdate from the repository', () async {
    when(repositories.getLatestUpdate(any))
        .thenAnswer((_) async => const Right([testLatestUpdate]));

    final result = await usecase(collectionName);

    verify(repositories.getLatestUpdate(collectionName));

    expect(result, const Right([testLatestUpdate]));
  });
}

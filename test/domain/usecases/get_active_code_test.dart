import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_lab/domain/entities/active_code.dart';
import 'package:honkai_lab/domain/repositories/honkai_lab_repositories.dart';
import 'package:honkai_lab/domain/usecases/get_active_codes.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_active_code_test.mocks.dart';

@GenerateMocks([HonkaiLabRepositories])
void main() {
  MockHonkaiLabRepositories repositories = MockHonkaiLabRepositories();
  GetActiveCodes usecase = GetActiveCodes(repositories: repositories);

  const String collectionName = "collectionName";

  const ActiveCode testActiveCode = ActiveCode(
      code: "code", reward: "reward", isActive: true, server: "server");

  test('should get ActiveCode from the repository', () async {
    when(repositories.getActiveCodes(any))
        .thenAnswer((_) async => const Right([testActiveCode]));

    final result = await usecase(collectionName);

    verify(repositories.getActiveCodes(collectionName));

    expect(result, const Right([testActiveCode]));
  });
}

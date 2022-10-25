import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_lab/domain/entities/elf_banner.dart';
import 'package:honkai_lab/domain/repositories/honkai_lab_repositories.dart';
import 'package:honkai_lab/domain/usecases/get_elf_banner.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_active_code_test.mocks.dart';

@GenerateMocks([HonkaiLabRepositories])
void main() {
  MockHonkaiLabRepositories repositories = MockHonkaiLabRepositories();
  GetElfBanner usecase = GetElfBanner(repositories: repositories);

  const String collectionName = "collectionName";

  const testElfBanner =
      ElfBanner(urlImage: "urlImage", endDate: "endDate", nameElf: "nameElf");

  test('should get ElfBanner from the repository', () async {
    when(repositories.getElfBanner(any))
        .thenAnswer((_) async => const Right([testElfBanner]));

    final result = await usecase(collectionName);

    verify(repositories.getElfBanner(collectionName));

    expect(result, const Right([testElfBanner]));
  });
}

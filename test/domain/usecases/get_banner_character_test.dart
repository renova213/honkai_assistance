import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_lab/domain/entities/banner_character.dart';
import 'package:honkai_lab/domain/repositories/honkai_lab_repositories.dart';
import 'package:honkai_lab/domain/usecases/get_banner_character.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_active_code_test.mocks.dart';

@GenerateMocks([HonkaiLabRepositories])
void main() {
  MockHonkaiLabRepositories repositories = MockHonkaiLabRepositories();
  GetBannerCharacter usecase = GetBannerCharacter(repositories: repositories);

  const String collectionName = "collectionName";

  const testBannerCharacter = BannerCharacter(
      urlImage: "urlImage", endDate: "endDate", nameCharacter: "nameCharacter");

  test('should get BannerCharacter from the repository', () async {
    when(repositories.getBannerCharacter(any))
        .thenAnswer((_) async => const Right([testBannerCharacter]));

    final result = await usecase(collectionName);

    verify(repositories.getBannerCharacter(collectionName));

    expect(result, const Right([testBannerCharacter]));
  });
}

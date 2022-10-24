import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_lab/domain/entities/weapon_stigmata_banner.dart';
import 'package:honkai_lab/domain/repositories/honkai_lab_repositories.dart';
import 'package:honkai_lab/domain/usecases/get_weapon_stigma_banner.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_active_code_test.mocks.dart';

@GenerateMocks([HonkaiLabRepositories])
void main() {
  MockHonkaiLabRepositories repositories = MockHonkaiLabRepositories();
  GetWeaponStigmaBanner usecase =
      GetWeaponStigmaBanner(repositories: repositories);

  const String collectionName = "collectionName";

  const testWeaponStigmataBanner = WeaponStigmataBanner(
      urlImageWeapon: "urlImageWeapon",
      urlImageStigmata: "urlImageStigmata",
      endDate: "endDate",
      nameWeapon: "nameWeapon",
      nameStigmata: "nameStigmata");

  test('should get LatestUpdate from the repository', () async {
    when(repositories.getWeaponStigmaBanner(any))
        .thenAnswer((_) async => const Right([testWeaponStigmataBanner]));

    final result = await usecase(collectionName);

    verify(repositories.getWeaponStigmaBanner(collectionName));

    expect(result, const Right([testWeaponStigmataBanner]));
  });
}

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_assistance/domain/entities/weapon_entity.dart';
import 'package:honkai_assistance/domain/usecases/get_weapon.dart';
import 'package:mockito/mockito.dart';

import '../../data/repositories/remote_repositories_impl_test.mocks.dart';

void main() {
  MockRemoteRepository remoteRepository = MockRemoteRepository();

  GetWeapon usecase = GetWeapon(remoteRepository: remoteRepository);

  const testWeaponEntity = WeaponEntity(
      weaponName: "string",
      type: "string",
      rank: "string",
      urlImage: "string",
      skillWeapons: [
        SkillWeaponEntity(titleSkill: "string", descriptionSkill: "string")
      ]);

  test('should get list of WeaponEntity from the repository', () async {
    when(remoteRepository.getWeapon())
        .thenAnswer((_) async => const Right([testWeaponEntity]));

    final result = await usecase();

    verify(remoteRepository.getWeapon());

    expect(result, const Right([testWeaponEntity]));
  });
}

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_assistance/domain/entities/equipment_banner_entity.dart';
import 'package:honkai_assistance/domain/usecases/get_equipment_banner.dart';
import 'package:mockito/mockito.dart';

import '../../data/repositories/remote_repositories_impl_test.mocks.dart';

void main() {
  MockRemoteRepository remoteRepository = MockRemoteRepository();

  GetEquipmentBanner usecase =
      GetEquipmentBanner(remoteRepository: remoteRepository);

  const testEquipmentBannerEntity = EquipmentBannerEntity(
      urlWeaponImage: "string",
      urlStigmataImage: "string",
      weaponName: "string",
      stigmataName: "string",
      endDate: "string");

  test('should get list of EquipmentBannerEntity from the repository',
      () async {
    when(remoteRepository.getEquipmentBanner())
        .thenAnswer((_) async => const Right([testEquipmentBannerEntity]));

    final result = await usecase();

    verify(remoteRepository.getEquipmentBanner());

    expect(result, const Right([testEquipmentBannerEntity]));
  });
}

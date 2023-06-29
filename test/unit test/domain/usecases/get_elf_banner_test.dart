import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_assistance/domain/entities/elf_banner_entity.dart';
import 'package:honkai_assistance/domain/usecases/get_elf_banner.dart';
import 'package:mockito/mockito.dart';

import '../../data/repositories/remote_repositories_impl_test.mocks.dart';

void main() {
  MockRemoteRepository remoteRepository = MockRemoteRepository();

  GetElfBanner usecase = GetElfBanner(remoteRepository: remoteRepository);

  const testElfBannerEntity =
      ElfBannerEntity(urlImage: "string", title: "string", endDate: "string");

  test('should get list of ElfBannerEntity from the repository', () async {
    when(remoteRepository.getElfBanner())
        .thenAnswer((_) async => const Right([testElfBannerEntity]));

    final result = await usecase();

    verify(remoteRepository.getElfBanner());

    expect(result, const Right([testElfBannerEntity]));
  });
}

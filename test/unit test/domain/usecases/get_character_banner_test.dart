import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_assistance/domain/entities/character_banner_entity.dart';
import 'package:honkai_assistance/domain/usecases/get_character_banner.dart';
import 'package:mockito/mockito.dart';

import '../../data/repositories/remote_repositories_impl_test.mocks.dart';

void main() {
  MockRemoteRepository remoteRepository = MockRemoteRepository();

  GetCharacterBanner usecase =
      GetCharacterBanner(remoteRepository: remoteRepository);

  const testCharacterBannerEntity = CharacterBannerEntity(
      urlImage: "string", title: "string", endDate: "string");

  test('should get list of CharacterBannerEntity from the repository',
      () async {
    when(remoteRepository.getCharacterBanner())
        .thenAnswer((_) async => const Right([testCharacterBannerEntity]));

    final result = await usecase();

    verify(remoteRepository.getCharacterBanner());

    expect(result, const Right([testCharacterBannerEntity]));
  });
}

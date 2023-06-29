import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_assistance/domain/entities/outfit_entity.dart';
import 'package:honkai_assistance/domain/usecases/get_outfit.dart';
import 'package:mockito/mockito.dart';

import '../../data/repositories/remote_repositories_impl_test.mocks.dart';

void main() {
  MockRemoteRepository remoteRepository = MockRemoteRepository();

  GetOutfit usecase = GetOutfit(remoteRepository: remoteRepository);
  const testOutfitEntity = OutfitEntity(
      outfitName: "string",
      outfitImage: "string",
      grade: "string",
      outfitIcon: "string");

  test('should get list of OutfitEntity from the repository', () async {
    when(remoteRepository.getOutfit())
        .thenAnswer((_) async => const Right([testOutfitEntity]));

    final result = await usecase();

    verify(remoteRepository.getOutfit());

    expect(result, const Right([testOutfitEntity]));
  });
}

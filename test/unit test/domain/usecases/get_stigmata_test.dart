import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_assistance/domain/entities/stigmata_entity.dart';
import 'package:honkai_assistance/domain/usecases/get_stigmata.dart';
import 'package:mockito/mockito.dart';

import '../../data/repositories/remote_repositories_impl_test.mocks.dart';

void main() {
  MockRemoteRepository remoteRepository = MockRemoteRepository();

  GetStigmata usecase = GetStigmata(remoteRepository: remoteRepository);

  const testStigmataEntity = StigmataEntity(
      stigmataName: "string",
      stigmataImage: "string",
      stigmataItems: [
        StigmataItemEntity(
            star: "string",
            stigmataImage: "string",
            stigmataType: "string",
            stigmataEffects: [
              StigmataEffectEntity(
                  titleEffect: "string", descriptionEffect: "string")
            ],
            stigmataPieceName: "string")
      ],
      setEffects: [
        SetEffectEntity(setName: "string", description: "string")
      ]);

  test('should get list of StigmataEntity from the repository', () async {
    when(remoteRepository.getStigmata())
        .thenAnswer((_) async => const Right([testStigmataEntity]));

    final result = await usecase();

    verify(remoteRepository.getStigmata());

    expect(result, const Right([testStigmataEntity]));
  });
}

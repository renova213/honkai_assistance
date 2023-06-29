import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_assistance/domain/entities/tier_list_entity.dart';
import 'package:honkai_assistance/domain/usecases/get_tier_list.dart';
import 'package:mockito/mockito.dart';

import '../../data/repositories/remote_repositories_impl_test.mocks.dart';

void main() {
  MockRemoteRepository remoteRepository = MockRemoteRepository();

  GetTierList usecase = GetTierList(remoteRepository: remoteRepository);

  const testTierListEntity = TierListEntity(
      valkyrieName: "string",
      image: "string",
      element: "string",
      role: "string",
      tier: "string");

  test('should get list of TierListEntity from the repository', () async {
    when(remoteRepository.getTierList())
        .thenAnswer((_) async => const Right([testTierListEntity]));

    final result = await usecase();

    verify(remoteRepository.getTierList());

    expect(result, const Right([testTierListEntity]));
  });
}

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_assistance/domain/entities/redeem_code_entity.dart';
import 'package:honkai_assistance/domain/usecases/get_redeem_code.dart';
import 'package:mockito/mockito.dart';

import '../../data/repositories/remote_repositories_impl_test.mocks.dart';

void main() {
  MockRemoteRepository remoteRepository = MockRemoteRepository();

  GetRedeemCode usecase = GetRedeemCode(remoteRepository: remoteRepository);

  const testRedeemCode =
      RedeemCodeEntity(code: "code", reward: "reward", server: "server");

  test('should get list of RedeemCodeEntity from the repository', () async {
    when(remoteRepository.getRedeemCode())
        .thenAnswer((_) async => const Right([testRedeemCode]));

    final result = await usecase();

    verify(remoteRepository.getRedeemCode());

    expect(result, const Right([testRedeemCode]));
  });
}

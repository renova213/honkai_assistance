import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_assistance/domain/entities/news_update_entity.dart';
import 'package:honkai_assistance/domain/usecases/get_news_update.dart';
import 'package:mockito/mockito.dart';

import '../../data/repositories/remote_repositories_impl_test.mocks.dart';

void main() {
  MockRemoteRepository remoteRepository = MockRemoteRepository();

  GetNewsUpdate usecase = GetNewsUpdate(remoteRepository: remoteRepository);

  const testNewsUpdateEntity = NewsUpdateEntity(
      urlWeb: "string",
      date: "string",
      title: "string",
      description: "string",
      urlImage: "string");

  test('should get list of NewsUpdateEntity from the repository', () async {
    when(remoteRepository.getNewsUpdate())
        .thenAnswer((_) async => const Right([testNewsUpdateEntity]));

    final result = await usecase();

    verify(remoteRepository.getNewsUpdate());

    expect(result, const Right([testNewsUpdateEntity]));
  });
}

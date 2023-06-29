import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_assistance/domain/entities/event_entity.dart';
import 'package:honkai_assistance/domain/usecases/get_event.dart';
import 'package:mockito/mockito.dart';

import '../../data/repositories/remote_repositories_impl_test.mocks.dart';

void main() {
  MockRemoteRepository remoteRepository = MockRemoteRepository();

  GetEvent usecase = GetEvent(remoteRepository: remoteRepository);

  const testEventEntity =
      EventEntity(urlImage: "string", title: "string", endDate: "string");

  test('should get list of EventEntity from the repository', () async {
    when(remoteRepository.getEvent())
        .thenAnswer((_) async => const Right([testEventEntity]));

    final result = await usecase();

    verify(remoteRepository.getEvent());

    expect(result, const Right([testEventEntity]));
  });
}

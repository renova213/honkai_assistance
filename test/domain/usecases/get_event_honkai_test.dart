import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_lab/domain/entities/event_honkai.dart';
import 'package:honkai_lab/domain/repositories/honkai_lab_repositories.dart';
import 'package:honkai_lab/domain/usecases/get_event_honkai.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_active_code_test.mocks.dart';

@GenerateMocks([HonkaiLabRepositories])
void main() {
  MockHonkaiLabRepositories repositories = MockHonkaiLabRepositories();
  GetEventHonkai usecase = GetEventHonkai(repositories: repositories);

  const String collectionName = "collectionName";

  const testEventHonkai = EventHonkai(
      title: "title",
      description: "description",
      urlImage: "urlImage",
      eventType: "eventType");

  test('should get EventHonkai from the repository', () async {
    when(repositories.getEventHonkai(any))
        .thenAnswer((_) async => const Right([testEventHonkai]));

    final result = await usecase(collectionName);

    verify(repositories.getEventHonkai(collectionName));

    expect(result, const Right([testEventHonkai]));
  });
}

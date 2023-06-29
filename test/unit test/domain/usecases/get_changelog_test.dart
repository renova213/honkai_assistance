import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_assistance/domain/entities/changelog_entity.dart';
import 'package:honkai_assistance/domain/usecases/get_changelog.dart';
import 'package:mockito/mockito.dart';

import '../../data/repositories/remote_repositories_impl_test.mocks.dart';

void main() {
  MockRemoteRepository remoteRepository = MockRemoteRepository();

  GetChangelog usecase = GetChangelog(remoteRepository: remoteRepository);

  const testChangelogEntity = ChangelogEntity(
      image: "string",
      name: "string",
      tierAfter: "string",
      tierBefore: "string");

  test('should get list of ChangelogEntity from the repository', () async {
    when(remoteRepository.getChangelog())
        .thenAnswer((_) async => const Right([testChangelogEntity]));

    final result = await usecase();

    verify(remoteRepository.getChangelog());

    expect(result, const Right([testChangelogEntity]));
  });
}

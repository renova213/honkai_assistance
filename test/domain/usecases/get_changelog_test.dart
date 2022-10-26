import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_lab/domain/entities/changelog.dart';
import 'package:honkai_lab/domain/repositories/honkai_lab_repositories.dart';
import 'package:honkai_lab/domain/usecases/get_changelog.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_active_code_test.mocks.dart';

@GenerateMocks([HonkaiLabRepositories])
void main() {
  MockHonkaiLabRepositories repositories = MockHonkaiLabRepositories();
  GetChangelog usecase = GetChangelog(repositories: repositories);

  const String collectionName = "collectionName";

  const testChangeLog = Changelog(characterLog: [
    CharacterLog(
        nameCharacter: "nameCharacter",
        tierBefore: "tierBefore",
        tierCurrent: "tierCurrent",
        urlImage: "urlImage")
  ], date: "date");

  test('should get Changelog from the repository', () async {
    when(repositories.getChangelog(any))
        .thenAnswer((_) async => const Right(testChangeLog));

    final result = await usecase(collectionName);

    verify(repositories.getChangelog(collectionName));

    expect(result, const Right(testChangeLog));
  });
}

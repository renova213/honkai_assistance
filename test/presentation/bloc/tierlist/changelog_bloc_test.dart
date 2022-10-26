import 'package:dartz/dartz.dart';
import 'package:honkai_lab/common/errors/failure.dart';
import 'package:honkai_lab/domain/entities/changelog.dart';
import 'package:honkai_lab/domain/usecases/get_changelog.dart';
import 'package:honkai_lab/presentation/blocs/tier_list/changelog_bloc/changelog_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import 'changelog_bloc_test.mocks.dart';

@GenerateMocks([GetChangelog])
void main() {
  MockGetChangelog mockGetChangelog = MockGetChangelog();
  ChangelogBloc bloc = ChangelogBloc(getChangelog: mockGetChangelog);

  const testChangeLog = Changelog(characterLog: [
    CharacterLog(
        nameCharacter: "nameCharacter",
        tierBefore: "tierBefore",
        tierCurrent: "tierCurrent",
        urlImage: "urlImage")
  ], date: "date");

  group('FetchChangelog', () {
    test('should get data from the GetChangelog usecase', () async {
      when(mockGetChangelog(any))
          .thenAnswer((_) async => const Right(testChangeLog));

      bloc.add(FetchChangelog());
      await untilCalled(mockGetChangelog("changelog"));

      verify(mockGetChangelog("changelog"));
    });

    test('should emit [Loading, Loaded] when data is gotten successfully',
        () async {
      when(mockGetChangelog(any))
          .thenAnswer((_) async => const Right(testChangeLog));

      expectLater(
          bloc.stream,
          emitsInOrder([
            LoadingChangelog(),
            const LoadedChangelog(changelogs: testChangeLog)
          ]));

      bloc.add(FetchChangelog());
    });

    test('should emit [Loading, Failure] when data is gotten successfully',
        () async {
      when(mockGetChangelog(any)).thenAnswer(
          (_) async => const Left(ServerFailure(message: 'ServerFailure')));

      expectLater(
          bloc.stream,
          emitsInOrder([
            LoadingChangelog(),
            const ErrorChangelog(errorMessage: "ServerFailure")
          ]));

      bloc.add(FetchChangelog());
    });
  });
}

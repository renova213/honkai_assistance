import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_assistance/common/constant.dart';
import 'package:honkai_assistance/common/error/error.dart';
import 'package:honkai_assistance/common/util/utils.dart';
import 'package:honkai_assistance/domain/entities/changelog_entity.dart';
import 'package:honkai_assistance/domain/usecases/get_changelog.dart';
import 'package:honkai_assistance/presentation/provider/changelog_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'changelog_provider_test.mocks.dart';

@GenerateMocks([GetChangelog])
void main() {
  const testChangelogEntity = ChangelogEntity(
      image: "string",
      name: "string",
      tierAfter: "string",
      tierBefore: "string");
  group('ChangelogProvider', () {
    MockGetChangelog usecase = MockGetChangelog();
    ChangelogProvider provider = ChangelogProvider(getChangelog: usecase);

    test(
        'should update app state and ChangelogEntity list on successful data retrieval',
        () async {
      when(usecase.call()).thenAnswer(
        (_) async => const Right([testChangelogEntity]),
      );

      await provider.getchangelogs();

      expect(provider.appstate, AppState.loaded);
      expect(provider.changelogs.length, 1);
    });

    test('should update app state and failureMessage on failed data retrieval',
        () async {
      when(usecase.call()).thenAnswer(
        (_) async => const Left(InternetFailure(message: internetError)),
      );

      await provider.getchangelogs();

      expect(provider.appstate, AppState.failed);
      expect(provider.failureMessage, internetError);
    });
  });
}

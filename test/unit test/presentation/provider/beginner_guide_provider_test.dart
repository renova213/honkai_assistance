import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_assistance/common/constant.dart';
import 'package:honkai_assistance/common/error/error.dart';
import 'package:honkai_assistance/common/util/utils.dart';
import 'package:honkai_assistance/data/models/guide_model.dart';
import 'package:honkai_assistance/domain/usecases/get_beginner_guide.dart';
import 'package:honkai_assistance/presentation/provider/beginner_guide_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'beginner_guide_provider_test.mocks.dart';

@GenerateMocks([GetBeginnerGuide])
void main() {
  const testGuideEntity = GuideModel(
      titleGuide: "string",
      urlImage: "string",
      descriptionGuide: "string",
      guideItems: [
        GuideItemModel(title: "string", guideDetails: [
          GuideItemDetailModel(
              description: "string", subtitle: "string", image: "string")
        ])
      ]);
  group('BeginnerGuideProvider', () {
    MockGetBeginnerGuide usecase = MockGetBeginnerGuide();
    BeginnerGuideProvider provider =
        BeginnerGuideProvider(getBeginnerGuide: usecase);

    test(
        'should update app state and GuideEntity list on successful data retrieval',
        () async {
      when(usecase.call()).thenAnswer(
        (_) async => const Right([testGuideEntity]),
      );

      await provider.getBeginnerGuides();

      expect(provider.appstate, AppState.loaded);
      expect(provider.beginnerGuides.length, 1);
    });

    test('should update app state and failureMessage on failed data retrieval',
        () async {
      when(usecase.call()).thenAnswer(
        (_) async => const Left(InternetFailure(message: internetError)),
      );

      await provider.getBeginnerGuides();

      expect(provider.appstate, AppState.failed);
      expect(provider.failureMessage, internetError);
    });
  });
}

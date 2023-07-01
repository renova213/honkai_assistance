import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_assistance/common/constant.dart';
import 'package:honkai_assistance/common/error/error.dart';
import 'package:honkai_assistance/common/util/utils.dart';
import 'package:honkai_assistance/domain/entities/character_banner_entity.dart';
import 'package:honkai_assistance/domain/usecases/get_character_banner.dart';
import 'package:honkai_assistance/presentation/provider/character_banner_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'character_banner_provider_test.mocks.dart';

@GenerateMocks([GetCharacterBanner])
void main() {
  const testCharacterBannerEntity = CharacterBannerEntity(
      urlImage: "string", title: "string", endDate: "string");
  group('CharacterBannerProvider', () {
    MockGetCharacterBanner usecase = MockGetCharacterBanner();
    CharacterBannerProvider provider =
        CharacterBannerProvider(getCharacterBanner: usecase);

    test(
        'should update app state and CharacterBannerEntity list on successful data retrieval',
        () async {
      when(usecase.call()).thenAnswer(
        (_) async => const Right([testCharacterBannerEntity]),
      );

      await provider.getCharacterBanners();

      expect(provider.appstate, AppState.loaded);
      expect(provider.characterBanners.length, 1);
    });

    test('should update app state and failureMessage on failed data retrieval',
        () async {
      when(usecase.call()).thenAnswer(
        (_) async => const Left(InternetFailure(message: internetError)),
      );

      await provider.getCharacterBanners();

      expect(provider.appstate, AppState.failed);
      expect(provider.failureMessage, internetError);
    });
  });
}

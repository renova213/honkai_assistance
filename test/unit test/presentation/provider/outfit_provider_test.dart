import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_assistance/common/constant.dart';
import 'package:honkai_assistance/common/error/error.dart';
import 'package:honkai_assistance/common/util/utils.dart';
import 'package:honkai_assistance/domain/entities/outfit_entity.dart';
import 'package:honkai_assistance/domain/usecases/get_outfit.dart';
import 'package:honkai_assistance/presentation/provider/outfit_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'outfit_provider_test.mocks.dart';

@GenerateMocks([GetOutfit])
void main() {
  OutfitEntity testOutfitEntity = const OutfitEntity(
      outfitName: "string",
      outfitImage: "string",
      grade: "string",
      outfitIcon: "string");

  group('OutfitProvider', () {
    MockGetOutfit usecase = MockGetOutfit();
    OutfitProvider provider = OutfitProvider(getOutfit: usecase);

    test(
        'should update app state and OutfitEntity list on successful data retrieval',
        () async {
      when(usecase.call()).thenAnswer(
        (_) async => Right([testOutfitEntity]),
      );

      await provider.getOutfits();

      expect(provider.appState, AppState.loaded);
      expect(provider.outfits.length, 1);
    });

    test('should update app state and failureMessage on failed data retrieval',
        () async {
      when(usecase.call()).thenAnswer(
        (_) async => const Left(InternetFailure(message: internetError)),
      );

      await provider.getOutfits();

      expect(provider.appState, AppState.failed);
      expect(provider.failureMessage, internetError);
    });
  });
}

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_assistance/common/constant.dart';
import 'package:honkai_assistance/common/error/error.dart';
import 'package:honkai_assistance/common/util/utils.dart';
import 'package:honkai_assistance/domain/entities/stigmata_entity.dart';
import 'package:honkai_assistance/domain/usecases/get_stigmata.dart';
import 'package:honkai_assistance/presentation/provider/stigmata_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'stigmata_provider_test.mocks.dart';

@GenerateMocks([GetStigmata])
void main() {
  StigmataEntity testStigmataEntity = const StigmataEntity(
      stigmataName: "string",
      stigmataImage: "string",
      stigmataItems: [
        StigmataItemEntity(
            star: "string",
            stigmataImage: "string",
            stigmataType: "string",
            stigmataEffects: [
              StigmataEffectEntity(
                  titleEffect: "string", descriptionEffect: "string")
            ],
            stigmataPieceName: "string")
      ],
      setEffects: [
        SetEffectEntity(setName: "string", description: "string")
      ]);

  group('StigmataProvider', () {
    MockGetStigmata usecase = MockGetStigmata();
    StigmataProvider provider = StigmataProvider(getStigmata: usecase);

    test(
        'should update app state and StigmataEntity list on successful data retrieval',
        () async {
      when(usecase.call()).thenAnswer(
        (_) async => Right([testStigmataEntity]),
      );

      await provider.getStigmatas();

      expect(provider.appState, AppState.loaded);
      expect(provider.stigmatas.length, 1);
    });

    test('should update app state and failureMessage on failed data retrieval',
        () async {
      when(usecase.call()).thenAnswer(
        (_) async => const Left(InternetFailure(message: internetError)),
      );

      await provider.getStigmatas();

      expect(provider.appState, AppState.failed);
      expect(provider.failureMessage, internetError);
    });
  });
}

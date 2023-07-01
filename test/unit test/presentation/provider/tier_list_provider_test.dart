import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_assistance/common/constant.dart';
import 'package:honkai_assistance/common/error/error.dart';
import 'package:honkai_assistance/common/util/utils.dart';
import 'package:honkai_assistance/domain/entities/tier_list_entity.dart';
import 'package:honkai_assistance/domain/usecases/get_tier_list.dart';
import 'package:honkai_assistance/presentation/provider/tier_list_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'tier_list_provider_test.mocks.dart';

@GenerateMocks([GetTierList])
void main() {
  TierListEntity testTierListEntity = const TierListEntity(
      valkyrieName: "string",
      image: "string",
      element: "string",
      role: "dps",
      tier: "s");

  group('TierListProvider', () {
    MockGetTierList usecase = MockGetTierList();
    TierListProvider provider = TierListProvider(getTierList: usecase);

    test(
        'should update app state and TierListEntity list on successful data retrieval',
        () async {
      when(usecase.call()).thenAnswer(
        (_) async => Right([testTierListEntity]),
      );

      await provider.getTierLists();

      expect(provider.appstate, AppState.loaded);
      expect(provider.dpsTierS.length, 1);
    });

    test('should update app state and failureMessage on failed data retrieval',
        () async {
      when(usecase.call()).thenAnswer(
        (_) async => const Left(InternetFailure(message: internetError)),
      );

      await provider.getTierLists();

      expect(provider.appstate, AppState.failed);
      expect(provider.failureMessage, internetError);
    });
  });
}

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_assistance/common/constant.dart';
import 'package:honkai_assistance/common/error/error.dart';
import 'package:honkai_assistance/common/util/utils.dart';
import 'package:honkai_assistance/domain/entities/redeem_code_entity.dart';
import 'package:honkai_assistance/domain/usecases/get_redeem_code.dart';
import 'package:honkai_assistance/presentation/provider/redeem_code_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'redeem_code_provider_test.mocks.dart';

@GenerateMocks([GetRedeemCode])
void main() {
  RedeemCodeEntity testRedeemCodeEntity =
      const RedeemCodeEntity(code: "code", reward: "reward", server: "sea");

  group('RedeemCodeProvider', () {
    MockGetRedeemCode usecase = MockGetRedeemCode();
    RedeemCodeProvider provider = RedeemCodeProvider(getRedeemCode: usecase);

    test(
        'should update app state and RedeemCodeEntity list on successful data retrieval',
        () async {
      when(usecase.call()).thenAnswer(
        (_) async => Right([testRedeemCodeEntity]),
      );

      await provider.getRedeemCodes();

      expect(provider.appState, AppState.loaded);
      expect(provider.redeemCodesSea.length, 1);
    });

    test('should update app state and failureMessage on failed data retrieval',
        () async {
      when(usecase.call()).thenAnswer(
        (_) async => const Left(InternetFailure(message: internetError)),
      );

      await provider.getRedeemCodes();

      expect(provider.appState, AppState.failed);
      expect(provider.failureMessage, internetError);
    });
  });
}

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_lab/common/errors/failure.dart';
import 'package:honkai_lab/domain/entities/active_code.dart';
import 'package:honkai_lab/domain/usecases/get_active_codes.dart';
import 'package:honkai_lab/presentation/blocs/home/redeem_code_bloc/redeem_code_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'redeem_code_bloc_test.mocks.dart';

@GenerateMocks([GetActiveCodes])
void main() {
  MockGetActiveCodes mockGetActiveCodes = MockGetActiveCodes();
  RedeemCodeBloc bloc = RedeemCodeBloc(getActiveCodes: mockGetActiveCodes);

  const ActiveCode testActiveCode = ActiveCode(
      code: "code", reward: "reward", isActive: true, server: "server");

  group('FetchActiveCode', () {
    test('should get data from the GetActiveCode usecase', () async {
      when(mockGetActiveCodes(any))
          .thenAnswer((_) async => const Right([testActiveCode]));

      bloc.add(FetchActiveCode());
      await untilCalled(mockGetActiveCodes("redeem_code"));

      verify(mockGetActiveCodes("redeem_code"));
    });

    test(
        'should emit [Loading, ActiveCodeState] when data is gotten successfully',
        () async {
      when(mockGetActiveCodes(any))
          .thenAnswer((_) async => const Right([testActiveCode]));

      expectLater(
          bloc.stream,
          emitsInOrder([
            LoadingRedeemCode(),
            const ActiveCodeState(codesGlobal: [], codesSea: [])
          ]));

      bloc.add(FetchActiveCode());
    });

    test('should emit [Loading, Failure] when data is gotten unsuccessful',
        () async {
      when(mockGetActiveCodes(any)).thenAnswer(
          (_) async => const Left(ServerFailure(message: 'ServerFailure')));

      expectLater(
          bloc.stream,
          emitsInOrder([
            LoadingRedeemCode(),
            const ErrorRedeemCode(errorMessage: 'ServerFailure')
          ]));

      bloc.add(FetchActiveCode());
    });
  });
}

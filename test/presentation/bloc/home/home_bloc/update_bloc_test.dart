import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_lab/common/errors/failure.dart';
import 'package:honkai_lab/domain/entities/latest_update.dart';
import 'package:honkai_lab/domain/usecases/get_last_update.dart';
import 'package:honkai_lab/presentation/blocs/home/update_bloc/update_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'update_bloc_test.mocks.dart';

@GenerateMocks([GetLatestUpdate])
void main() {
  MockGetLatestUpdate mockGetLatestUpdate = MockGetLatestUpdate();
  UpdateBloc bloc = UpdateBloc(getLatestUpdate: mockGetLatestUpdate);

  const testLatestUpdate = LatestUpdate(
      urlWeb: "urlWeb",
      title: "title",
      description: "description",
      urlImage: "urlImage");

  group('FetchUpdate', () {
    test('should get data from the GetLatestUpdate usecase', () async {
      when(mockGetLatestUpdate(any))
          .thenAnswer((_) async => const Right([testLatestUpdate]));

      bloc.add(FetchUpdate());
      await untilCalled(mockGetLatestUpdate("update"));

      verify(mockGetLatestUpdate("update"));
    });

    test('should emit [Loading, Loaded] when data is gotten successfully',
        () async {
      when(mockGetLatestUpdate(any))
          .thenAnswer((_) async => const Right([testLatestUpdate]));

      expectLater(
          bloc.stream,
          emitsInOrder([
            UpdateLoading(),
            const UpdateLoaded(listUpdates: [testLatestUpdate])
          ]));

      bloc.add(FetchUpdate());
    });

    test('should emit [Loading, Failure] when data is gotten successfully',
        () async {
      when(mockGetLatestUpdate(any)).thenAnswer(
          (_) async => const Left(ServerFailure(message: 'ServerFailure')));

      expectLater(
          bloc.stream,
          emitsInOrder([
            UpdateLoading(),
            const UpdateError(errorMessage: "ServerFailure")
          ]));

      bloc.add(FetchUpdate());
    });
  });
}

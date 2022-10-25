import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_lab/common/errors/failure.dart';
import 'package:honkai_lab/domain/entities/banner_character.dart';
import 'package:honkai_lab/domain/usecases/get_banner_character.dart';
import 'package:honkai_lab/presentation/blocs/home/banner_character_bloc/banner_character_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'banner_character_bloc_test.mocks.dart';

@GenerateMocks([GetBannerCharacter])
void main() {
  MockGetBannerCharacter mockGetBannerCharacter = MockGetBannerCharacter();
  BannerCharacterBloc bloc =
      BannerCharacterBloc(getBannerCharacter: mockGetBannerCharacter);

  const testBannerCharacter = BannerCharacter(
      urlImage: "urlImage", endDate: "endDate", nameCharacter: "nameCharacter");

  group('FetchBannerCharacter', () {
    test('should get data from the GetBannerCharacter usecase', () async {
      when(mockGetBannerCharacter(any))
          .thenAnswer((_) async => const Right([testBannerCharacter]));

      bloc.add(FetchBannerCharacter());
      await untilCalled(mockGetBannerCharacter("banner_character"));

      verify(mockGetBannerCharacter("banner_character"));
    });

    test('should emit [Loading, Loaded] when data is gotten successfully',
        () async {
      when(mockGetBannerCharacter(any))
          .thenAnswer((_) async => const Right([testBannerCharacter]));

      expectLater(
          bloc.stream,
          emitsInOrder([
            LoadingBannerCharacter(),
            const LoadedBannerCharacter(characterBanners: [testBannerCharacter])
          ]));

      bloc.add(FetchBannerCharacter());
    });

    test('should emit [Loading, Failure] when data is gotten successfully',
        () async {
      when(mockGetBannerCharacter(any)).thenAnswer(
          (_) async => const Left(ServerFailure(message: 'ServerFailure')));

      expectLater(
          bloc.stream,
          emitsInOrder([
            LoadingBannerCharacter(),
            const ErrorBannerCharacter(errorMessage: "ServerFailure")
          ]));

      bloc.add(FetchBannerCharacter());
    });
  });
}

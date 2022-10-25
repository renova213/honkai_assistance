import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_lab/common/errors/failure.dart';
import 'package:honkai_lab/domain/entities/weapon_stigmata_banner.dart';
import 'package:honkai_lab/domain/usecases/get_weapon_stigma_banner.dart';
import 'package:honkai_lab/presentation/blocs/home/weapon_stigmata_bloc/weapon_stigmata_bloc_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'weapon_stigmata_bloc_test.mocks.dart';

@GenerateMocks([GetWeaponStigmaBanner])
void main() {
  MockGetWeaponStigmaBanner mockGetWeaponStigmaBanner =
      MockGetWeaponStigmaBanner();
  WeaponStigmataBloc bloc =
      WeaponStigmataBloc(getWeaponStigmaBanner: mockGetWeaponStigmaBanner);

  const testWeaponStigmataBanner = WeaponStigmataBanner(
      urlImageWeapon: "urlImageWeapon",
      urlImageStigmata: "urlImageStigmata",
      endDate: "endDate",
      nameWeapon: "nameWeapon",
      nameStigmata: "nameStigmata");

  group('FetchWeaponStigmataBanner', () {
    test('should get data from the GetWeaponStigmata usecase', () async {
      when(mockGetWeaponStigmaBanner(any))
          .thenAnswer((_) async => const Right([testWeaponStigmataBanner]));

      bloc.add(FetchWeaponStigmataBanner());
      await untilCalled(mockGetWeaponStigmaBanner("weapon_stigma_banner"));

      verify(mockGetWeaponStigmaBanner("weapon_stigma_banner"));
    });

    test('should emit [Loading, Loaded] when data is gotten successfully',
        () async {
      when(mockGetWeaponStigmaBanner(any))
          .thenAnswer((_) async => const Right([testWeaponStigmataBanner]));

      expectLater(
          bloc.stream,
          emitsInOrder([
            LoadingWeaponStigmataBanner(),
            const LoadedWeaponStigmataBanner(
                weaponStigmataBanners: [testWeaponStigmataBanner])
          ]));

      bloc.add(FetchWeaponStigmataBanner());
    });

    test('should emit [Loading, Failure] when data is gotten successfully',
        () async {
      when(mockGetWeaponStigmaBanner(any)).thenAnswer(
          (_) async => const Left(ServerFailure(message: 'ServerFailure')));

      expectLater(
          bloc.stream,
          emitsInOrder([
            LoadingWeaponStigmataBanner(),
            const ErrorWeaponStigmataBanner(errorMessage: "ServerFailure")
          ]));

      bloc.add(FetchWeaponStigmataBanner());
    });
  });
}

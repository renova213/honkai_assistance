import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_lab/common/errors/failure.dart';
import 'package:honkai_lab/domain/entities/elf_banner.dart';
import 'package:honkai_lab/domain/usecases/get_elf_banner.dart';
import 'package:honkai_lab/presentation/blocs/home/elf_banner_bloc/elf_banner_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'elf_banner_bloc_test.mocks.dart';

@GenerateMocks([GetElfBanner])
void main() {
  MockGetElfBanner mockGetElfBanner = MockGetElfBanner();
  ElfBannerBloc bloc = ElfBannerBloc(getElfBanner: mockGetElfBanner);

  const testElfBanner =
      ElfBanner(urlImage: "urlImage", endDate: "endDate", nameElf: "nameElf");

  group('FetchElfBanner', () {
    test('should get data from the ElfBanner usecase', () async {
      when(mockGetElfBanner(any))
          .thenAnswer((_) async => const Right([testElfBanner]));

      bloc.add(FetchElfBanner());
      await untilCalled(mockGetElfBanner("elf_banner"));

      verify(mockGetElfBanner("elf_banner"));
    });

    test('should emit [Loading, Loaded] when data is gotten successfully',
        () async {
      when(mockGetElfBanner(any))
          .thenAnswer((_) async => const Right([testElfBanner]));

      expectLater(
          bloc.stream,
          emitsInOrder([
            LoadingElfBanner(),
            const LoadedElfBanner(elfBanners: [testElfBanner])
          ]));

      bloc.add(FetchElfBanner());
    });

    test('should emit [Loading, Failure] when data is gotten successfully',
        () async {
      when(mockGetElfBanner(any)).thenAnswer(
          (_) async => const Left(ServerFailure(message: 'ServerFailure')));

      expectLater(
          bloc.stream,
          emitsInOrder([
            LoadingElfBanner(),
            const ErrorElfBanner(errorMessage: "ServerFailure")
          ]));

      bloc.add(FetchElfBanner());
    });
  });
}

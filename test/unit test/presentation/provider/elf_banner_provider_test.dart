import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_assistance/common/constant.dart';
import 'package:honkai_assistance/common/error/error.dart';
import 'package:honkai_assistance/common/util/utils.dart';
import 'package:honkai_assistance/domain/entities/elf_banner_entity.dart';
import 'package:honkai_assistance/domain/usecases/get_elf_banner.dart';
import 'package:honkai_assistance/presentation/provider/elf_banner_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'elf_banner_provider_test.mocks.dart';

@GenerateMocks([GetElfBanner])
void main() {
  const testElfBannerEntity =
      ElfBannerEntity(urlImage: "string", title: "string", endDate: "string");

  group('ElfBannerProvider', () {
    MockGetElfBanner usecase = MockGetElfBanner();
    ElfBannerProvider provider = ElfBannerProvider(getElfBanner: usecase);

    test(
        'should update app state and ElfBannerEntity list on successful data retrieval',
        () async {
      when(usecase.call()).thenAnswer(
        (_) async => const Right([testElfBannerEntity]),
      );

      await provider.getElfBanners();

      expect(provider.appstate, AppState.loaded);
      expect(provider.elfBanners.length, 1);
    });

    test('should update app state and failureMessage on failed data retrieval',
        () async {
      when(usecase.call()).thenAnswer(
        (_) async => const Left(InternetFailure(message: internetError)),
      );

      await provider.getElfBanners();

      expect(provider.appstate, AppState.failed);
      expect(provider.failureMessage, internetError);
    });
  });
}

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_assistance/common/constant.dart';
import 'package:honkai_assistance/common/error/error.dart';
import 'package:honkai_assistance/common/util/utils.dart';
import 'package:honkai_assistance/domain/entities/equipment_banner_entity.dart';
import 'package:honkai_assistance/domain/usecases/get_equipment_banner.dart';
import 'package:honkai_assistance/presentation/provider/equipment_banner_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'equipment_banner_provider_test.mocks.dart';

@GenerateMocks([GetEquipmentBanner])
void main() {
  const testEquipmentBannerEntity = EquipmentBannerEntity(
      urlWeaponImage: "string",
      urlStigmataImage: "string",
      weaponName: "string",
      stigmataName: "string",
      endDate: "string");
  group('EquipmentBannerProvider', () {
    MockGetEquipmentBanner usecase = MockGetEquipmentBanner();
    EquipmentBannerProvider provider =
        EquipmentBannerProvider(getEquipmentBanner: usecase);

    test(
        'should update app state and EquipmentBannerEntity list on successful data retrieval',
        () async {
      when(usecase.call()).thenAnswer(
        (_) async => const Right([testEquipmentBannerEntity]),
      );

      await provider.getEquipmentBanners();

      expect(provider.appstate, AppState.loaded);
      expect(provider.equipmentBanners.length, 1);
    });

    test('should update app state and failureMessage on failed data retrieval',
        () async {
      when(usecase.call()).thenAnswer(
        (_) async => const Left(InternetFailure(message: internetError)),
      );

      await provider.getEquipmentBanners();

      expect(provider.appstate, AppState.failed);
      expect(provider.failureMessage, internetError);
    });
  });
}

import 'package:flutter/foundation.dart';
import 'package:honkai_assistance/domain/entities/equipment_banner_entity.dart';

import '../../../common/util/enum_state.dart';
import '../../../domain/usecases/remote/get_equipment_banner.dart';

class EquipmentBannerProvider extends ChangeNotifier {
  final GetEquipmentBanner getEquipmentBanner;
  EquipmentBannerProvider({required this.getEquipmentBanner});

  List<EquipmentBannerEntity> _equipmentBanners = [];
  AppState _appState = AppState.loading;
  String _failureMessage = "";

  List<EquipmentBannerEntity> get equipmentBanners => _equipmentBanners;
  AppState get appstate => _appState;
  String get failureMessage => _failureMessage;

  Future<void> getEquipmentBanners() async {
    changeAppState(AppState.loading);

    final failureOrEquipmentBanner = await getEquipmentBanner.call();

    failureOrEquipmentBanner.fold(
      (failure) {
        _failureMessage = failure.message;
        changeAppState(AppState.failed);
      },
      (equipmentBanners) {
        _equipmentBanners = equipmentBanners;
        changeAppState(AppState.loaded);
      },
    );
  }

  changeAppState(AppState state) {
    _appState = state;
    notifyListeners();
  }
}

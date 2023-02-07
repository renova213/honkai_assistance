import 'package:flutter/foundation.dart';
import 'package:honkai_assistance/domain/entities/elf_banner_entity.dart';

import '../../../common/util/enum_state.dart';
import '../../../domain/usecases/remote/get_elf_banner.dart';

class ElfBannerProvider extends ChangeNotifier {
  final GetElfBanner getElfBanner;
  ElfBannerProvider({required this.getElfBanner});

  List<ElfBannerEntity> _elfBanners = [];
  AppState _appState = AppState.loading;
  String _failureMessage = "";

  List<ElfBannerEntity> get elfBanners => _elfBanners;
  AppState get appstate => _appState;
  String get failureMessage => _failureMessage;

  Future<void> getElfBanners() async {
    changeAppState(AppState.loading);

    final failureOrElfBanner = await getElfBanner.call();

    failureOrElfBanner.fold(
      (failure) {
        _failureMessage = failure.message;
        changeAppState(AppState.failed);
      },
      (elfBanners) {
        _elfBanners = elfBanners;
        changeAppState(AppState.loaded);
      },
    );
  }

  changeAppState(AppState state) {
    _appState = state;
    notifyListeners();
  }
}

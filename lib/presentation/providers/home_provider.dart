import 'package:flutter/cupertino.dart';
import 'package:honkai_lab/domain/entities/active_code.dart';
import 'package:honkai_lab/domain/entities/banner_character.dart';
import 'package:honkai_lab/domain/entities/elf_banner.dart';
import 'package:honkai_lab/domain/entities/event_honkai.dart';
import 'package:honkai_lab/domain/entities/last_update.dart';
import 'package:honkai_lab/domain/entities/weapon_stigmata_banner.dart';
import 'package:honkai_lab/domain/usecases/get_active_codes.dart';
import 'package:honkai_lab/domain/usecases/get_banner_character.dart';
import 'package:honkai_lab/domain/usecases/get_elf_banner.dart';
import 'package:honkai_lab/domain/usecases/get_event_honkai.dart';
import 'package:honkai_lab/domain/usecases/get_last_update.dart';
import 'package:honkai_lab/domain/usecases/get_weapon_stigma_banner.dart';

import '../../common/errors/failure.dart';
import '../../common/utils/finite_state.dart';

class HomeProvider extends ChangeNotifier {
  final GetActiveCodes getActiveCodes;
  final GetEventHonkai getEventHonkai;
  final GetLatestUpdate getLastUpdate;
  final GetBannerCharacter getBannerCharacter;
  final GetElfBanner getElfBanner;
  final GetWeaponStigmaBanner getWeaponStigmaBanner;
  HomeProvider(
      {required this.getActiveCodes,
      required this.getEventHonkai,
      required this.getLastUpdate,
      required this.getBannerCharacter,
      required this.getElfBanner,
      required this.getWeaponStigmaBanner});

  int _indexServer = 0;
  int get indexServer => _indexServer;

  int _indexEvent = 0;
  int get indexEvent => _indexEvent;

  MyState _myState = MyState.loading;
  MyState get myState => _myState;

  final List<ActiveCode> _codesGlobal = [];

  List<ActiveCode> get codesGlobal => _codesGlobal;

  final List<ActiveCode> _codesSea = [];

  List<ActiveCode> get codesSea => _codesSea;

  final List<EventHonkai> _currentEvents = [];
  List<EventHonkai> get currentEvents => _currentEvents;

  final List<EventHonkai> _upcomingEvent = [];
  List<EventHonkai> get upcomingEvent => _upcomingEvent;

  List<LatestUpdate> _listUpdates = [];
  List<LatestUpdate> get listUpdates => _listUpdates;

  List<BannerCharacter> _bannerCharacters = [];
  List<BannerCharacter> get bannerCharacters => _bannerCharacters;

  List<ElfBanner> _elfBanners = [];
  List<ElfBanner> get elfBanners => _elfBanners;

  List<WeaponStigmataBanner> _weaponStigmatasBanners = [];
  List<WeaponStigmataBanner> get weaponStigmatasBanners =>
      _weaponStigmatasBanners;

  void changeIndexServer(int index) {
    _indexServer = index;
    notifyListeners();
  }

  void changeIndexEvent(int index) {
    _indexEvent = index;
    notifyListeners();
  }

  void fetchActiveCodes() async {
    try {
      _myState = MyState.loading;
      notifyListeners();

      final response = await getActiveCodes("redeem_code");

      response.fold(
        (failure) => throw _mapFailureOrMessage(failure),
        (activeCode) {
          for (var i in activeCode) {
            if (i.server == "Global" && !_codesGlobal.contains(i)) {
              _codesGlobal.add(i);
            } else if (!_codesGlobal.contains(i) && !_codesSea.contains(i)) {
              _codesSea.add(i);
            }
          }
        },
      );

      _myState = MyState.hasData;
      notifyListeners();
    } catch (e) {
      _myState = MyState.failed;
      notifyListeners();
    }
  }

  void fetchEventHonkai() async {
    try {
      _myState = MyState.loading;
      notifyListeners();

      final response = await getEventHonkai("event");

      response.fold(
        (failure) => throw _mapFailureOrMessage(failure),
        (event) {
          for (var i in event) {
            if (i.eventType == "current" && !_currentEvents.contains(i)) {
              _currentEvents.add(i);
            } else if (!_upcomingEvent.contains(i) &&
                !_currentEvents.contains(i)) {
              _upcomingEvent.add(i);
            }
          }
        },
      );

      _myState = MyState.hasData;
      notifyListeners();
    } catch (e) {
      _myState = MyState.failed;
      notifyListeners();
    }
  }

  void fetchLatestUpdate() async {
    try {
      _myState = MyState.loading;
      notifyListeners();

      final response = await getLastUpdate("update");

      response.fold(
        (failure) => throw _mapFailureOrMessage(failure),
        (update) {
          _listUpdates = update;
        },
      );

      _myState = MyState.hasData;
      notifyListeners();
    } catch (e) {
      _myState = MyState.failed;
      notifyListeners();
    }
  }

  void fetchBannerCharacter() async {
    try {
      _myState = MyState.loading;
      notifyListeners();

      final response = await getBannerCharacter("banner_character");

      response.fold(
        (failure) => throw _mapFailureOrMessage(failure),
        (bannerCharacters) {
          _bannerCharacters = bannerCharacters;
        },
      );

      _myState = MyState.hasData;
      notifyListeners();
    } catch (e) {
      _myState = MyState.failed;
      notifyListeners();
    }
  }

  void fetchElfBanner() async {
    try {
      _myState = MyState.loading;
      notifyListeners();

      final response = await getElfBanner("elf_banner");

      response.fold(
        (failure) => throw _mapFailureOrMessage(failure),
        (elfBanner) {
          _elfBanners = elfBanner;
        },
      );

      _myState = MyState.hasData;
      notifyListeners();
    } catch (e) {
      _myState = MyState.failed;
      notifyListeners();
    }
  }

  void fetchWeaponStigmaBanner() async {
    try {
      _myState = MyState.loading;
      notifyListeners();

      final response = await getWeaponStigmaBanner("weapon_stigma_banner");

      response.fold(
        (failure) => throw _mapFailureOrMessage(failure),
        (elfBanner) {
          _weaponStigmatasBanners = elfBanner;
        },
      );

      _myState = MyState.hasData;
      notifyListeners();
    } catch (e) {
      _myState = MyState.failed;
      notifyListeners();
    }
  }

  String _mapFailureOrMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'ServerFailure';
      default:
        return 'Unexpected Error';
    }
  }
}

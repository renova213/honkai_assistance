import 'package:flutter/material.dart';
import 'package:honkai_assistance/domain/entities/tier_list_entity.dart';
import 'package:honkai_assistance/domain/usecases/remote/get_tier_list.dart';

import '../../../common/util/enum_state.dart';

class TierListProvider extends ChangeNotifier {
  final GetTierList getTierList;
  TierListProvider({required this.getTierList});

  List<TierListEntity> _dpsTierEX = [];
  List<TierListEntity> _dpsTierS = [];
  List<TierListEntity> _dpsTierA = [];
  List<TierListEntity> _dpsTierB = [];
  List<TierListEntity> _dpsTierOut = [];
  List<TierListEntity> _supportTierEX = [];
  List<TierListEntity> _supportTierS = [];
  List<TierListEntity> _supportTierA = [];
  List<TierListEntity> _supportTierB = [];
  List<TierListEntity> _supportTierOut = [];
  AppState _appState = AppState.loading;
  String _failureMessage = "";
  String _typeATKImage = '';
  late Color _bottomBorder;

  List<TierListEntity> get dpsTierEX => _dpsTierEX;
  List<TierListEntity> get dpsTierS => _dpsTierS;
  List<TierListEntity> get dpsTierA => _dpsTierA;
  List<TierListEntity> get dpsTierB => _dpsTierB;
  List<TierListEntity> get dpsTierOut => _dpsTierOut;
  List<TierListEntity> get supportTierEX => _supportTierEX;
  List<TierListEntity> get supportTierS => _supportTierS;
  List<TierListEntity> get supportTierA => _supportTierA;
  List<TierListEntity> get supportTierB => _supportTierB;
  List<TierListEntity> get supportTierOut => _supportTierOut;
  AppState get appstate => _appState;
  String get failureMessage => _failureMessage;
  String get typaATKImage => _typeATKImage;
  Color get bottomBorder => _bottomBorder;

  Future<void> getTierLists() async {
    changeAppState(AppState.loading);

    final failureOrTierList = await getTierList.call();

    failureOrTierList.fold(
      (failure) {
        _failureMessage = failure.message;
        changeAppState(AppState.failed);
      },
      (tierList) {
        //dps
        _dpsTierEX = tierList
            .where((e) =>
                e.tier.toLowerCase() == 'ex' && e.role.toLowerCase() == 'dps')
            .toList();
        _dpsTierS = tierList
            .where((e) =>
                e.tier.toLowerCase() == 's' && e.role.toLowerCase() == 'dps')
            .toList();
        _dpsTierA = tierList
            .where((e) =>
                e.tier.toLowerCase() == 'a' && e.role.toLowerCase() == 'dps')
            .toList();
        _dpsTierB = tierList
            .where((e) =>
                e.tier.toLowerCase() == 'b' && e.role.toLowerCase() == 'dps')
            .toList();
        _dpsTierOut = tierList
            .where((e) =>
                e.tier.toLowerCase() == 'out' && e.role.toLowerCase() == 'dps')
            .toList();

        //support
        _supportTierEX = tierList
            .where((e) =>
                e.tier.toLowerCase() == 'ex' &&
                e.role.toLowerCase() == 'support')
            .toList();
        _supportTierS = tierList
            .where((e) =>
                e.tier.toLowerCase() == 's' &&
                e.role.toLowerCase() == 'support')
            .toList();
        _supportTierA = tierList
            .where((e) =>
                e.tier.toLowerCase() == 'a' &&
                e.role.toLowerCase() == 'support')
            .toList();
        _supportTierB = tierList
            .where((e) =>
                e.tier.toLowerCase() == 'b' &&
                e.role.toLowerCase() == 'support')
            .toList();
        _supportTierOut = tierList
            .where((e) =>
                e.tier.toLowerCase() == 'out' &&
                e.role.toLowerCase() == 'support')
            .toList();

        changeAppState(AppState.loaded);
      },
    );
  }

  void filterTypeATKImage(String urlImage) {
    switch (urlImage) {
      case 'Physical':
        _typeATKImage = 'https://i.postimg.cc/8PtQfzqw/a-removebg-preview.png';
        _bottomBorder = Colors.orange;
        break;
      case 'Ice':
        _typeATKImage = 'https://i.postimg.cc/qhzGyvWB/ice.png';
        _bottomBorder = Colors.blue;
        break;
      case 'Fire':
        _typeATKImage = 'https://i.postimg.cc/6ysh4wcw/fire.png';
        _bottomBorder = Colors.red;
        break;
      case 'Lightning':
        _typeATKImage = 'https://i.postimg.cc/4Hcb2FJr/lightning.png';
        _bottomBorder = Colors.purple;
        break;
      default:
        _typeATKImage = '';
        _bottomBorder = Colors.white;
    }
  }

  changeAppState(AppState state) {
    _appState = state;
    notifyListeners();
  }
}

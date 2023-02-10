import 'package:flutter/material.dart';
import 'package:honkai_assistance/domain/entities/redeem_code_entity.dart';

import '../../../common/util/enum_state.dart';
import '../../../domain/usecases/remote/get_redeem_code.dart';

class RedeemCodeProvider extends ChangeNotifier {
  final GetRedeemCode getRedeemCode;
  RedeemCodeProvider({required this.getRedeemCode});

  final List<RedeemCodeEntity> _redeemCodesSea = [];
  final List<RedeemCodeEntity> _redeemCodesGlobal = [];
  AppState _appState = AppState.loading;
  String _failureMessage = "";

  List<RedeemCodeEntity> get redeemCodesSea => _redeemCodesSea;
  List<RedeemCodeEntity> get redeemCodesGlobal => _redeemCodesGlobal;
  AppState get appState => _appState;
  String get failureMessage => _failureMessage;

  Future<void> getRedeemCodes() async {
    changeAppState(AppState.loading);

    final failureOrRedeemCode = await getRedeemCode.call();

    failureOrRedeemCode.fold(
      (failure) {
        _failureMessage = failure.message;
        changeAppState(AppState.failed);
      },
      (redeemCodes) {
        for (var i in redeemCodes) {
          if (i.server.toLowerCase() == "global" &&
              !_redeemCodesGlobal.contains(i)) {
            _redeemCodesGlobal.add(i);
          }
          if (i.server.toLowerCase() == "sea" && !_redeemCodesSea.contains(i)) {
            _redeemCodesSea.add(i);
          }
          changeAppState(AppState.loaded);
        }
      },
    );
  }

  changeAppState(AppState state) {
    _appState = state;
    notifyListeners();
  }
}

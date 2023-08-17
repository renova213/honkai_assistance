import 'package:flutter/material.dart';
import 'package:honkai_assistance/common/util/utils.dart';
import 'package:honkai_assistance/domain/entities/topup_checkout_entity.dart';
import 'package:honkai_assistance/domain/usecases/top_up_checkout_usecase.dart';

class TopUpCheckoutProvider extends ChangeNotifier {
  final TopUpCheckoutUsecase topUpCheckoutUsecase;
  TopUpCheckoutProvider({required this.topUpCheckoutUsecase});

  AppState _appState = AppState.loading;
  String _failureMessage = '';
  List<TopUpCheckoutEntity> _topUpCheckouts = [];
  List<TopUpCheckoutEntity> _filterTopUpCheckouts = [];
  late TopUpCheckoutEntity _topUpCheckout;
  int _filterIndex = 0;
  String _filterState = "";

  AppState get appState => _appState;
  List<TopUpCheckoutEntity> get topUpCheckouts => _topUpCheckouts;
  List<TopUpCheckoutEntity> get filterTopUpCheckouts => _filterTopUpCheckouts;
  String get failureMessage => _failureMessage;
  String get filterState => _filterState;
  int get filterIndex => _filterIndex;
  TopUpCheckoutEntity? get topUpCheckout => _topUpCheckout;

  Future<void> getTopUpCheckouts(String userEmail) async {
    changeAppState(AppState.loading);

    final failureOrTopUpCheckouts =
        await topUpCheckoutUsecase.getTopUpCheckout(userEmail);

    failureOrTopUpCheckouts.fold(
      (failure) {
        _failureMessage = failure.message;
        changeAppState(AppState.failed);
      },
      (topUpCheckouts) {
        _topUpCheckouts = topUpCheckouts;

        changeAppState(AppState.loaded);
      },
    );
  }

  Future<void> getTopUpCheckoutsByInvoiceId(
      String userEmail, String invoiceId) async {
    final failureOrTopUpCheckouts = await topUpCheckoutUsecase
        .getTopUpCheckoutByInvoiceId(userEmail, invoiceId);

    failureOrTopUpCheckouts.fold(
      (failure) {
        _failureMessage = failure.message;
      },
      (topUpCheckout) {
        _topUpCheckout = topUpCheckout;
      },
    );
  }

  Future<void> createTopUpCheckout(
      {required TopUpCheckoutEntity topUpCheckout,
      required String userEmail}) async {
    try {
      await topUpCheckoutUsecase.postTopUpCheckout(topUpCheckout, userEmail);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateTopUpCheckout(
      {required TopUpCheckoutEntity topUpCheckout,
      required String userEmail,
      required String id}) async {
    try {
      await topUpCheckoutUsecase.updateTopUpCheckout(
          topUpCheckout, userEmail, id);
      await getTopUpCheckouts(userEmail);
      await getTopUpCheckoutsByInvoiceId(userEmail, topUpCheckout.invoiceId);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> changeFilterState(int index) async {
    if (index == 0) {
      _filterState = "";
      _filterIndex = index;
      _filterTopUpCheckouts = topUpCheckouts;
    } else if (index == 1) {
      _filterState = "Pending";
      _filterIndex = index;
      _filterTopUpCheckouts =
          topUpCheckouts.where((e) => e.status == index - 1).toList();
    } else if (index == 2) {
      _filterState = "Process";
      _filterIndex = index;
      _filterTopUpCheckouts =
          topUpCheckouts.where((e) => e.status == index - 1).toList();
    } else if (index == 3) {
      _filterState = "Done";
      _filterIndex = index;
      _filterTopUpCheckouts =
          topUpCheckouts.where((e) => e.status == index - 1).toList();
    } else if (index == 4) {
      _filterState = "Cancel";
      _filterIndex = index;
      _filterTopUpCheckouts =
          topUpCheckouts.where((e) => e.status == index - 1).toList();
    }
    _filterTopUpCheckouts.sort(
      (a, b) => b.createdAtFormat.compareTo(a.createdAtFormat),
    );
    notifyListeners();
  }

  changeAppState(AppState state) {
    _appState = state;
    notifyListeners();
  }
}

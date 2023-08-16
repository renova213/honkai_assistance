import 'dart:io';

import 'package:flutter/material.dart';
import 'package:honkai_assistance/common/util/utils.dart';
import 'package:honkai_assistance/domain/entities/topup_checkout_entity.dart';
import 'package:honkai_assistance/domain/usecases/get_top_up_checkout.dart';
import 'package:honkai_assistance/domain/usecases/post_top_up_checkout.dart';
import 'package:image_picker/image_picker.dart';

class TopUpCheckoutProvider extends ChangeNotifier {
  final PostTopUpCheckout postTopUpCheckout;
  final GetTopUpCheckout getTopUpCheckout;
  TopUpCheckoutProvider(
      {required this.postTopUpCheckout, required this.getTopUpCheckout});

  AppState _appState = AppState.loading;
  String _failureMessage = '';
  List<TopUpCheckoutEntity> _topUpCheckouts = [];
  List<TopUpCheckoutEntity> _filterTopUpCheckouts = [];
  late TopUpCheckoutEntity _topUpCheckout;
  int _filterIndex = 0;
  String _filterState = "";
  final String _urlProductImage = "";
  File? _image;
  String? _imageName;
  final _imagePicker = ImagePicker();

  AppState get appState => _appState;
  List<TopUpCheckoutEntity> get topUpCheckouts => _topUpCheckouts;
  List<TopUpCheckoutEntity> get filterTopUpCheckouts => _filterTopUpCheckouts;
  String get failureMessage => _failureMessage;
  String get filterState => _filterState;
  int get filterIndex => _filterIndex;
  TopUpCheckoutEntity? get topUpCheckout => _topUpCheckout;
  String get urlProductImage => _urlProductImage;
  File? get image => _image;
  String? get imageName => _imageName;

  Future<void> getTopUpCheckouts(String userEmail) async {
    changeAppState(AppState.loading);

    final failureOrTopUpCheckouts =
        await getTopUpCheckout.getTopUpCheckout(userEmail);

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
    final failureOrTopUpCheckouts = await getTopUpCheckout
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
      await postTopUpCheckout.call(topUpCheckout, userEmail);
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

  void clearImage() {
    if (_image != null) {
      _image = null;
    }
    notifyListeners();
  }

  Future<void> getImage() async {
    final image = await _imagePicker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      _image = File(image.path);
      _imageName = image.name;
    }
    notifyListeners();
  }

  changeAppState(AppState state) {
    _appState = state;
    notifyListeners();
  }
}

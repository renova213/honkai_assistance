import 'package:flutter/material.dart';
import 'package:honkai_assistance/domain/entities/outfit_entity.dart';
import 'package:honkai_assistance/domain/usecases/remote/get_outfit.dart';

import '../../../common/util/enum_state.dart';

class OutfitProvider extends ChangeNotifier {
  final GetOutfit getOutfit;
  OutfitProvider({required this.getOutfit});

  List<OutfitEntity> _outfits = [];
  AppState _appState = AppState.loading;
  String _failureMessage = "";
  late Color _bottomColor;

  List<OutfitEntity> get outfits => _outfits;
  AppState get appState => _appState;
  String get failureMessage => _failureMessage;
  Color get bottomColor => _bottomColor;

  Future<void> getOutfits() async {
    changeAppState(AppState.loading);

    final failureOrOutfit = await getOutfit.call();

    failureOrOutfit.fold(
      (failure) {
        _failureMessage = failure.message;
        changeAppState(AppState.failed);
      },
      (outfits) {
        _outfits = outfits;

        _outfits.sort(
          (a, b) => a.outfitName.compareTo(b.outfitName),
        );
        changeAppState(AppState.loaded);
      },
    );
  }

  Future<void> searchOutfit(String value) async {
    if (value.isNotEmpty) {
      await getOutfits();

      _outfits = _outfits
          .where(
              (e) => e.outfitName.toLowerCase().contains(value.toLowerCase()))
          .toList();
    } else {
      await getOutfits();
    }
    notifyListeners();
  }

  void changeBottomColor(String star) {
    switch (star) {
      case '4.0':
        _bottomColor = Colors.purple;
        break;

      default:
        _bottomColor = Colors.blue;
    }
  }

  changeAppState(AppState state) {
    _appState = state;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:honkai_assistance/domain/entities/outfit_entity.dart';

import '../../../common/util/enum_state.dart';
import '../../domain/usecases/get_outfit.dart';

class OutfitProvider extends ChangeNotifier {
  final GetOutfit getOutfit;
  OutfitProvider({required this.getOutfit});

  List<OutfitEntity> _outfits = [];
  List<OutfitEntity> _searchResults = [];
  AppState _appState = AppState.loading;
  String _failureMessage = "";
  late Color _bottomColor;

  List<OutfitEntity> get outfits => _outfits;
  List<OutfitEntity> get searchResults => _searchResults;
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
    _searchResults = _outfits
        .where((e) => e.outfitName.toLowerCase().contains(value.toLowerCase()))
        .toList();

    notifyListeners();
  }

  void changeBottomColor(String star) {
    switch (star) {
      case '5.0':
        _bottomColor = Colors.yellow;
        break;
      case '4.0':
        _bottomColor = Colors.purple;
        break;
      case '3.0':
        _bottomColor = Colors.blue;
        break;
      case '2.0':
        _bottomColor = Colors.lightBlue;
        break;
      default:
        _bottomColor = Colors.green;
    }
  }

  changeAppState(AppState state) {
    _appState = state;
    notifyListeners();
  }
}

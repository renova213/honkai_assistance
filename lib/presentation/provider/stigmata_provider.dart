import 'package:flutter/material.dart';
import 'package:honkai_assistance/domain/entities/stigmata_entity.dart';

import '../../../common/util/enum_state.dart';
import '../../domain/usecases/get_stigmata.dart';

class StigmataProvider extends ChangeNotifier {
  final GetStigmata getStigmata;
  StigmataProvider({required this.getStigmata});

  List<StigmataEntity> _stigmatas = [];
  AppState _appState = AppState.loading;
  String _failureMessage = "";
  late Color _bottomColor;

  List<StigmataEntity> get stigmatas => _stigmatas;
  AppState get appState => _appState;
  String get failureMessage => _failureMessage;
  Color get bottomColor => _bottomColor;

  Future<void> getStigmatas() async {
    changeAppState(AppState.loading);

    final failureOrStigmata = await getStigmata.call();

    failureOrStigmata.fold(
      (failure) {
        _failureMessage = failure.message;
        changeAppState(AppState.failed);
      },
      (stigmatas) {
        _stigmatas = stigmatas;

        _stigmatas.sort(
          (a, b) => a.stigmataName.compareTo(b.stigmataName),
        );
        changeAppState(AppState.loaded);
      },
    );
  }

  Future<void> searchStigmata(String value) async {
    if (value.isNotEmpty) {
      await getStigmatas();

      _stigmatas = _stigmatas
          .where(
              (e) => e.stigmataName.toLowerCase().contains(value.toLowerCase()))
          .toList();
    } else {
      await getStigmatas();
    }
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
      default:
        _bottomColor = Colors.green;
    }
  }

  changeAppState(AppState state) {
    _appState = state;
    notifyListeners();
  }
}

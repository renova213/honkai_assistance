import 'package:flutter/material.dart';
import 'package:honkai_assistance/domain/entities/elf_entity.dart';

import '../../../common/util/enum_state.dart';
import '../../domain/usecases/get_elf.dart';

class ElfProvider extends ChangeNotifier {
  final GetElf getElf;
  ElfProvider({required this.getElf});

  List<ElfEntity> _elfs = [];
  List<ElfEntity> _searchResults = [];
  AppState _appState = AppState.loading;
  String _failureMessage = "";
  late Color _bottomColor;
  String _typeATK = 'Any Type';
  int _index = 0;

  List<ElfEntity> get elfs => _elfs;
  List<ElfEntity> get searchResults => _searchResults;
  AppState get appState => _appState;
  String get failureMessage => _failureMessage;
  Color get bottomColor => _bottomColor;
  String get typeATK => _typeATK;
  int get index => _index;

  Future<void> getElfs() async {
    changeAppState(AppState.loading);

    final failureOrElf = await getElf.call();

    failureOrElf.fold(
      (failure) {
        _failureMessage = failure.message;
        changeAppState(AppState.failed);
      },
      (elfs) {
        _elfs = elfs;

        _elfs.sort(
          (a, b) => a.elfName.compareTo(b.elfName),
        );
        changeAppState(AppState.loaded);
      },
    );
  }

  void changeBottomColor(String typeATK) {
    switch (typeATK) {
      case 'Physical':
        _bottomColor = Colors.amber;
        break;
      case 'Ice':
        _bottomColor = Colors.blue;
        break;
      case 'Lightning':
        _bottomColor = Colors.purple;
        break;
      case 'Fire':
        _bottomColor = Colors.red;
        break;
      default:
        _bottomColor = Colors.amber;
    }
  }

  Future<void> searchElf(
      {required String searchValue, required String typeValue}) async {
    _typeATK = typeValue;
    _searchResults = _elfs
        .where((e) =>
            e.elfName.toLowerCase().contains(searchValue.toLowerCase()) &&
            e.typeATK.toLowerCase().contains(
                typeValue == "Any Type" ? "" : typeValue.toLowerCase()))
        .toList();

    notifyListeners();
  }

  Future<void> changeIndex(index) async {
    _index = index;
    notifyListeners();
  }

  changeAppState(AppState state) {
    _appState = state;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:honkai_assistance/domain/entities/elf_entity.dart';

import '../../../common/util/enum_state.dart';
import '../../domain/usecases/get_elf.dart';

class ElfProvider extends ChangeNotifier {
  final GetElf getElf;
  ElfProvider({required this.getElf});

  List<ElfEntity> _elfs = [];
  AppState _appState = AppState.loading;
  String _failureMessage = "";
  late Color _bottomColor;
  String _typeATK = 'Any ATK';

  List<ElfEntity> get elfs => _elfs;
  AppState get appState => _appState;
  String get failureMessage => _failureMessage;
  Color get bottomColor => _bottomColor;
  String get typeATK => _typeATK;

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

  Future<void> changeTypeATK(String value) async {
    if (_typeATK != value) {
      _typeATK = value;
      notifyListeners();

      switch (value) {
        case 'Physical':
          await getElfs();
          _elfs = _elfs.where((e) => e.typeATK.contains(value)).toList();
          break;
        case 'Fire':
          await getElfs();
          _elfs = _elfs.where((e) => e.typeATK.contains(value)).toList();
          break;
        case 'Ice':
          await getElfs();
          _elfs = _elfs.where((e) => e.typeATK.contains(value)).toList();
          break;
        case 'Lightning':
          await getElfs();
          _elfs = _elfs.where((e) => e.typeATK.contains(value)).toList();
          break;
        default:
          await getElfs();
      }
    }

    notifyListeners();
  }

  Future<void> searchElf(String value) async {
    if (value.isNotEmpty) {
      await getElfs();
      await changeTypeATK('Any ATK');

      _elfs = _elfs
          .where((e) => e.elfName.toLowerCase().contains(value.toLowerCase()))
          .toList();
    } else {
      await getElfs();
    }
    notifyListeners();
  }

  changeAppState(AppState state) {
    _appState = state;
    notifyListeners();
  }
}
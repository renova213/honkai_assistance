import 'package:flutter/material.dart';
import 'package:honkai_assistance/domain/entities/changelog_entity.dart';

import '../../../common/util/enum_state.dart';
import '../../domain/usecases/get_changelog.dart';

class ChangelogProvider extends ChangeNotifier {
  final GetChangelog getChangelog;
  ChangelogProvider({required this.getChangelog});

  List<ChangelogEntity> _changelogs = [];
  AppState _appState = AppState.loading;
  String _failureMessage = "";
  late Color _afterTierColor;
  late Color _beforeTierColor;

  List<ChangelogEntity> get changelogs => _changelogs;
  AppState get appstate => _appState;
  String get failureMessage => _failureMessage;
  Color get afterTierColor => _afterTierColor;
  Color get beforeTierColor => _beforeTierColor;

  Future<void> getchangelogs() async {
    changeAppState(AppState.loading);

    final failureOrChangelog = await getChangelog.call();

    failureOrChangelog.fold(
      (failure) {
        _failureMessage = failure.message;
        changeAppState(AppState.failed);
      },
      (changelogs) {
        _changelogs = changelogs;
        changeAppState(AppState.loaded);
      },
    );
  }

  void afterColorTier(String tier) {
    switch (tier) {
      case 'EX':
        _afterTierColor = const Color(0xFFF44336);
        break;
      case 'S':
        _afterTierColor = const Color(0xFFFF5252);
        break;
      case 'A':
        _afterTierColor = const Color(0xFFFF9800);
        break;
      case 'B':
        _afterTierColor = const Color(0xFF2B65EC);
        break;
      case 'OUT':
        _afterTierColor = const Color(0xFF82B1FF);
        break;
      default:
        _afterTierColor = const Color(0xFF2196F3);
    }
  }

  void beforeColorTier(String tier) {
    switch (tier) {
      case 'EX':
        _beforeTierColor = const Color(0xFFF44336);
        break;
      case 'S':
        _beforeTierColor = const Color(0xFFFF5252);
        break;
      case 'A':
        _beforeTierColor = const Color(0xFFFF9800);
        break;
      case 'B':
        _beforeTierColor = const Color(0xFF2B65EC);
        break;
      case 'OUT':
        _beforeTierColor = const Color(0xFF82B1FF);
        break;
      default:
        _beforeTierColor = const Color(0xFF2196F3);
    }
  }

  changeAppState(AppState state) {
    _appState = state;
    notifyListeners();
  }
}

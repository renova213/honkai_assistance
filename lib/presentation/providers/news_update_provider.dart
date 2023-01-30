import 'package:flutter/material.dart';
import 'package:honkai_assistance/common/util/utils.dart';
import 'package:honkai_assistance/domain/entities/news_update_entity.dart';
import 'package:honkai_assistance/domain/usecases/get_news_update.dart';

class NewsUpdateProvider extends ChangeNotifier {
  final GetNewsUpdate getNewsUpdate;
  NewsUpdateProvider({required this.getNewsUpdate});

  List<NewsUpdateEntity> _newsUpdates = [];
  AppState _appState = AppState.loading;
  String _failureMessage = "";

  List<NewsUpdateEntity> get newsUpdates => _newsUpdates;
  AppState get appstate => _appState;
  String get failureMessage => _failureMessage;

  Future<void> getNewsUpdates() async {
    changeAppState(AppState.loading);

    final failureOrNewsUpdate = await getNewsUpdate.call();

    failureOrNewsUpdate.fold(
      (failure) {
        _failureMessage = failure.message;
        changeAppState(AppState.failed);
      },
      (newsUpdates) {
        _newsUpdates = newsUpdates;
        changeAppState(AppState.loaded);
      },
    );
  }

  changeAppState(AppState state) {
    _appState = state;
    notifyListeners();
  }
}

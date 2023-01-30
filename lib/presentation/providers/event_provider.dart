import 'package:flutter/material.dart';
import 'package:honkai_assistance/domain/entities/event_entity.dart';
import 'package:honkai_assistance/domain/usecases/get_event.dart';

import '../../common/util/utils.dart';

class EventProvider extends ChangeNotifier {
  final GetEvent getEvent;
  EventProvider({required this.getEvent});

  List<EventEntity> _events = [];
  AppState _appState = AppState.loading;
  String _failureMessage = "";

  List<EventEntity> get events => _events;
  AppState get appstate => _appState;
  String get failureMessage => _failureMessage;

  Future<void> getEvents() async {
    changeAppState(AppState.loading);

    final failureOrEvent = await getEvent.call();

    failureOrEvent.fold(
      (failure) {
        _failureMessage = failure.message;
        changeAppState(AppState.failed);
      },
      (events) {
        _events = events;
        changeAppState(AppState.loaded);
      },
    );
  }

  changeAppState(AppState state) {
    _appState = state;
    notifyListeners();
  }
}

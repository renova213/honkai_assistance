import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  int _indexServer = 0;
  int get indexServer => _indexServer;

  int _indexEvent = 0;
  int get indexEvent => _indexEvent;

  void changeIndexServer(int index) {
    _indexServer = index;
    notifyListeners();
  }

  void changeIndexEvent(int index) {
    _indexEvent = index;
    notifyListeners();
  }
}

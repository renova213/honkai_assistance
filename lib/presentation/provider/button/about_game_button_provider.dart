import 'package:flutter/cupertino.dart';

class AboutGameButtonProvider extends ChangeNotifier {
  int _indexHeader = 0;

  int get indexHeader => _indexHeader;

  void changeIndexHeader(int index) {
    _indexHeader = index;
    notifyListeners();
  }
}

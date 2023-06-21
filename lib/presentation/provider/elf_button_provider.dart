import 'package:flutter/cupertino.dart';

class ElfButtonProvider extends ChangeNotifier {
  int _index = 0;

  int get index => _index;

  Future<void> changeIndex(index) async {
    _index = index;
    notifyListeners();
  }
}

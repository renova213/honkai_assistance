import 'package:flutter/material.dart';

class TierListButtonProvider extends ChangeNotifier {
  String _role = 'DPS';

  String get role => _role;

  void changeRole(String value) {
    _role = value;
    notifyListeners();
  }
}

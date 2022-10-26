import 'package:flutter/material.dart';

class CharacterProvider extends ChangeNotifier {
  final List<String> _itemsDropdown = ["Sort By A-Z", "Sort By Z-A"];
  List<String> get itemsDropdown => _itemsDropdown;

  final List<String> _itemsElement = [
    "Any Element",
    "Thunder",
    "Fire",
    "Physical",
    "Ice"
  ];
  List<String> get itemsElement => _itemsElement;

  final List<String> _itemsType = [
    "Mecha",
    "Physic",
    "Bio",
    "Quantum",
    "Imaginary"
  ];

  List<String> get itemsType => _itemsType;

  String _value = "Sort By A-Z";
  String get value => _value;

  Color _colorBottom = Colors.red;
  Color get colorBottom => _colorBottom;

  void changeValueButton(String value) {
    _value = value;
    notifyListeners();
  }

  void changeBottomBorderColor(String element) {
    if (element == "ice") {
      _colorBottom = Colors.lightBlue;
    }

    if (element == "physical") {
      _colorBottom = Colors.orange;
    }

    if (element == "fire") {
      _colorBottom = Colors.red;
    }

    if (element == "thunder") {
      _colorBottom = Colors.purple;
    }
  }
}

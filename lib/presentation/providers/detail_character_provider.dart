import 'package:flutter/cupertino.dart';
import '../../domain/entities/menu.dart';

class DetailCharacterProvider extends ChangeNotifier {
  int _indexItem = 0;
  int get indexItem => _indexItem;

  final List<Menu> _listMenu = [
    Menu(
        menu: "Profile",
        urlImage: 'https://i.ibb.co/1srJ0Jk/2-removebg-preview.png'),
    Menu(menu: "Rank Up", urlImage: 'https://i.ibb.co/LvrC14q/4.png'),
    Menu(
        menu: "Equipment",
        urlImage: "https://i.ibb.co/3pkBjtC/1-removebg-preview.png"),
    Menu(
        menu: "Team",
        urlImage: "https://i.ibb.co/BzNykVR/asf-removebg-preview.png"),
    Menu(
        menu: "Elysian Realm",
        urlImage:
            "https://i.ibb.co/Y8g3YfQ/ezgif-4-2067b74ea5-removebg-preview.png"),
  ];
  List<Menu> get listMenu => _listMenu;

  void changeIndexItem(int index) {
    _indexItem = index;
    notifyListeners();
  }
}

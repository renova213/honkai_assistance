import 'package:flutter/material.dart';
import 'package:honkai_lab/domain/entities/menu.dart';
import 'package:honkai_lab/presentation/pages/widgets/about/about_game.dart';
import 'package:honkai_lab/presentation/pages/widgets/home/home.dart';
import 'package:honkai_lab/presentation/pages/widgets/tierlist/tier_list.dart';

class HeaderProvider extends ChangeNotifier {
  bool _isExpand = false;
  bool get isExpand => _isExpand;

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  int _indexPage = 0;
  int get indexPage => _indexPage;

  List<Widget> pages = [
    const Home(),
    const AboutGame(),
    const TierList(),
  ];

  final List<Menu> _listMenu = [
    Menu(
        menu: "Home",
        urlImage: 'https://i.ibb.co/1srJ0Jk/2-removebg-preview.png'),
    Menu(menu: "About The Game", urlImage: 'https://i.ibb.co/LvrC14q/4.png'),
    Menu(
        menu: "Tier List",
        urlImage: "https://i.ibb.co/3pkBjtC/1-removebg-preview.png"),
  ];
  List<Menu> get listMenu => _listMenu;

  void isExpanded(bool isExpand) {
    _isExpand = isExpand;
    notifyListeners();
  }

  void index(int currentIndex) {
    _currentIndex = currentIndex;
    notifyListeners();
  }

  void indexPages(int indexPage) {
    _indexPage = indexPage;
    notifyListeners();
  }
}

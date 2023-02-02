import 'package:flutter/material.dart';
import 'package:honkai_assistance/presentation/screens/about/about_game_screen.dart';
import 'package:honkai_assistance/presentation/screens/home/home_screen.dart';

import '../../domain/entities/menu.dart';
import '../screens/database/database_screen.dart';

class CustomSidebarProvider extends ChangeNotifier {
  bool _isExpand = false;
  bool get isExpand => _isExpand;

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  int _indexPage = 0;
  int get indexPage => _indexPage;

  List<Widget> pages = [
    const HomeScreen(),
    const AboutGameScreen(),
    const DatabaseScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];

  final List<Menu> _listMenu = const [
    Menu(menu: "Home", assetImage: 'assets/images/menu_1.png'),
    Menu(menu: "About The Game", assetImage: 'assets/images/menu_2.png'),
    Menu(menu: "Database", assetImage: "assets/images/menu_3.png"),
    Menu(menu: "Tier List", assetImage: "assets/images/menu_4.png"),
    Menu(menu: "Guides", assetImage: "assets/images/menu_5.png")
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

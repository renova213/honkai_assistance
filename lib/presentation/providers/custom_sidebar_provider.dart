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
    Menu(
        menu: "Home",
        urlImage: 'https://i.ibb.co/1srJ0Jk/2-removebg-preview.png'),
    Menu(menu: "About The Game", urlImage: 'https://i.ibb.co/LvrC14q/4.png'),
    Menu(
        menu: "Database",
        urlImage: "https://i.ibb.co/3pkBjtC/1-removebg-preview.png"),
    Menu(
        menu: "Tier List",
        urlImage: "https://i.ibb.co/BzNykVR/asf-removebg-preview.png"),
    Menu(
        menu: "Guides",
        urlImage:
            "https://i.ibb.co/Y8g3YfQ/ezgif-4-2067b74ea5-removebg-preview.png")
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

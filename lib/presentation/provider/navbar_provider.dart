import 'package:flutter/cupertino.dart';

import '../screens/about/about_game_screen.dart';
import '../screens/database/database_screen.dart';
import '../screens/guide/guide_menu_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/tier_list/tier_list_screen.dart';

class NavbarProvider extends ChangeNotifier {
  int _currentIndex = 0;
  final List<Map<String, dynamic>> _navBarItems = [
    {"title": "Home", "assetImage": "assets/images/menu_1.png"},
    {"title": "About", "assetImage": "assets/images/menu_2.png"},
    {"title": "Database", "assetImage": "assets/images/menu_3.png"},
    {"title": "Tier List", "assetImage": "assets/images/menu_4.png"},
    {"title": "Guide", "assetImage": "assets/images/menu_5.png"},
  ];
  final List<Widget> _pages = const [
    HomeScreen(),
    AboutGameScreen(),
    DatabaseScreen(),
    TierListScreen(),
    GuideMenuScreen(),
  ];

  int get currentIndex => _currentIndex;
  List<Map<String, dynamic>> get navBarItems => _navBarItems;
  List<Widget> get pages => _pages;

  void changeIndex(int currentIndex) {
    _currentIndex = currentIndex;
    notifyListeners();
  }
}

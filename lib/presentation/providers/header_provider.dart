import 'package:flutter/material.dart';
import 'package:honkai_lab/domain/entities/menu.dart';
import 'package:honkai_lab/presentation/pages/widgets/home/home.dart';

class HeaderProvider extends ChangeNotifier {
  bool _isExpand = false;
  bool get isExpand => _isExpand;

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  int _indexPage = 0;
  int get indexPage => _indexPage;

  List<Widget> pages = [
    const Home(),
  ];

  final List<Menu> _listMenu = [
    Menu(menu: "Home"),
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

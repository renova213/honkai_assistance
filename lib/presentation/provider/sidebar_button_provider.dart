import 'package:flutter/cupertino.dart';

class SidebarButtonProvider extends ChangeNotifier {
  bool _isExpand = false;
  int _currentIndex = 0;
  int _indexPage = 0;

  bool get isExpand => _isExpand;
  int get currentIndex => _currentIndex;
  int get indexPage => _indexPage;

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

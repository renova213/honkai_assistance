import 'package:flutter/material.dart';
import 'package:honkai_assistance/domain/usecases/local/sidebar_menu.dart';
import 'package:honkai_assistance/presentation/screens/about/about_game_screen.dart';
import 'package:honkai_assistance/presentation/screens/database/database_screen.dart';
import 'package:honkai_assistance/presentation/screens/home/home_screen.dart';
import 'package:honkai_assistance/presentation/screens/tier_list/tier_list_screen.dart';

import '../../../domain/entities/menu.dart';

class SidebarProvider extends ChangeNotifier {
  final SidebarMenu sidebarMenu;
  SidebarProvider({required this.sidebarMenu});

  List<Menu> _sidebarMenus = [];
  final List<Widget> _pages = const [
    HomeScreen(),
    AboutGameScreen(),
    DatabaseScreen(),
    TierListScreen(),
    HomeScreen(),
  ];

  List<Menu> get sidebarMenus => _sidebarMenus;
  List<Widget> get pages => _pages;

  Future<void> getSidebarMenu() async {
    _sidebarMenus = await sidebarMenu.call();
    notifyListeners();
  }
}

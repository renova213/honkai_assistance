import 'package:flutter/material.dart';
import 'package:honkai_assistance/domain/entities/menu_database.dart';
import 'package:honkai_assistance/presentation/screens/battlesuit/battlesuit_screen.dart';

class DatabaseProvider extends ChangeNotifier {
  final List<MenuDatabase> _menuDatabases = const [
    MenuDatabase(
        title: "Battlesuit",
        assetImage: 'assets/images/battlesuit.png',
        widget: BattlesuitScreen()),
    MenuDatabase(
        title: "Elf",
        assetImage: 'assets/images/elf.png',
        widget: BattlesuitScreen()),
    MenuDatabase(
        title: "Stigmata",
        assetImage: 'assets/images/stigmata.png',
        widget: BattlesuitScreen()),
    MenuDatabase(
        title: "Weapon",
        assetImage: 'assets/images/weapon.png',
        widget: BattlesuitScreen()),
    MenuDatabase(
        title: "outfit",
        assetImage: 'assets/images/outfit.png',
        widget: BattlesuitScreen()),
  ];

  List<MenuDatabase> get menuDatabases => _menuDatabases;
}

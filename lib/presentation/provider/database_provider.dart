import 'package:flutter/material.dart';

import '../screens/battlesuit/battlesuit_screen.dart';
import '../screens/elf/elf_screen.dart';
import '../screens/outfit/outfit_screen.dart';
import '../screens/stigmata/stigmata_screen.dart';
import '../screens/weapon/weapon_screen.dart';

class DatabaseProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _menuDatabases = [
    {
      "title": "Battlesuit",
      "assetImage": 'assets/images/battlesuit.png',
      "widget": const BattlesuitScreen()
    },
    {
      "title": "Elf",
      "assetImage": 'assets/images/elf.png',
      "widget": const ElfScreen()
    },
    {
      "title": "Stigmata",
      "assetImage": 'assets/images/stigmata.png',
      "widget": const StigmataScreen()
    },
    {
      "title": "Weapon",
      "assetImage": 'assets/images/weapon.png',
      "widget": const WeaponScreen()
    },
    {
      "title": "outfit",
      "assetImage": 'assets/images/outfit.png',
      "widget": const OutfitScreen()
    },
  ];

  List<Map<String, dynamic>> get menuDatabases => _menuDatabases;
}

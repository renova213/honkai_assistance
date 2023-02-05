import 'package:honkai_assistance/domain/entities/menu_database.dart';
import 'package:honkai_assistance/presentation/screens/elf/elf_screen.dart';
import 'package:honkai_assistance/presentation/screens/stigmata/stigmata_screen.dart';

import '../../../presentation/screens/battlesuit/battlesuit_screen.dart';

class MenuDatabaseUsecase {
  Future<List<MenuDatabase>> call() async {
    const List<MenuDatabase> menuDatabases = [
      MenuDatabase(
          title: "Battlesuit",
          assetImage: 'assets/images/battlesuit.png',
          widget: BattlesuitScreen()),
      MenuDatabase(
          title: "Elf",
          assetImage: 'assets/images/elf.png',
          widget: ElfScreen()),
      MenuDatabase(
          title: "Stigmata",
          assetImage: 'assets/images/stigmata.png',
          widget: StigmataScreen()),
      MenuDatabase(
          title: "Weapon",
          assetImage: 'assets/images/weapon.png',
          widget: BattlesuitScreen()),
      MenuDatabase(
          title: "outfit",
          assetImage: 'assets/images/outfit.png',
          widget: BattlesuitScreen()),
    ];

    return menuDatabases;
  }
}

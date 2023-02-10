import 'package:honkai_assistance/domain/entities/menu.dart';

class SidebarMenu {
  Future<List<Menu>> call() async {
    const sidebarMenu = [
      Menu(menu: "Home", assetImage: 'assets/images/menu_1.png'),
      Menu(menu: "About The Game", assetImage: 'assets/images/menu_2.png'),
      Menu(menu: "Database", assetImage: "assets/images/menu_3.png"),
      Menu(menu: "Tier List", assetImage: "assets/images/menu_4.png"),
      Menu(menu: "Guides", assetImage: "assets/images/menu_5.png")
    ];
    return sidebarMenu;
  }
}

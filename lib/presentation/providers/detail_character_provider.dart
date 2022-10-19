import 'package:flutter/cupertino.dart';
import 'package:honkai_lab/domain/entities/rank_up_level.dart';

import '../../domain/entities/menu.dart';

class DetailCharacterProvider extends ChangeNotifier {
  int _indexItem = 0;
  int get indexItem => _indexItem;

  final List<Menu> _listMenu = [
    Menu(
        menu: "Profile",
        urlImage: 'https://i.ibb.co/1srJ0Jk/2-removebg-preview.png'),
    Menu(menu: "Rank Up", urlImage: 'https://i.ibb.co/LvrC14q/4.png'),
    Menu(
        menu: "Equipment",
        urlImage: "https://i.ibb.co/3pkBjtC/1-removebg-preview.png"),
    Menu(
        menu: "Boss Coverage",
        urlImage: "https://i.ibb.co/BzNykVR/asf-removebg-preview.png"),
    Menu(
        menu: "Team",
        urlImage:
            "https://i.ibb.co/Y8g3YfQ/ezgif-4-2067b74ea5-removebg-preview.png"),
    Menu(
        menu: "Elysian Realm",
        urlImage:
            "https://i.ibb.co/Y8g3YfQ/ezgif-4-2067b74ea5-removebg-preview.png"),
  ];
  List<Menu> get listMenu => _listMenu;

  final List<RankUpLevel> _rankUpCharacters = const [
    RankUpLevel(
        rankUp: "S1",
        description: "The level cap of Dawn's Glory is raised from 3 to 6"),
    RankUpLevel(
        rankUp: "S2",
        description: "Unlock skills Seedling's Vitality & Star's Radiance"),
    RankUpLevel(
        rankUp: "S3",
        description: "Unlock skill An Ode to Love and Compassion"),
    RankUpLevel(rankUp: "SS", description: "Unlock Skill Elysia's Allure"),
    RankUpLevel(
        rankUp: "SS1",
        description:
            "The level cap of Snowflakes Swirling raised from 7 to 11"),
    RankUpLevel(
        rankUp: "SS2",
        description:
            "The level cap of Spring's Sweetnes is raised from 3 to 6"),
    RankUpLevel(
        rankUp: "SS3",
        description:
            "The level cap of  An Ode to Love and Compassion is raised from 1 to 3"),
    RankUpLevel(
        rankUp: "SSS", description: "Unlock skill Night Dew's Serenity"),
  ];
  List<RankUpLevel> get rankUpCharacters => _rankUpCharacters;

  void changeIndexItem(int index) {
    _indexItem = index;
    notifyListeners();
  }
}

import 'package:flutter/cupertino.dart';
import 'package:honkai_lab/domain/entities/active_code.dart';
import 'package:honkai_lab/domain/entities/banner_character.dart';
import 'package:honkai_lab/domain/entities/elf_banner.dart';
import 'package:honkai_lab/domain/entities/event.dart';
import 'package:honkai_lab/domain/entities/update.dart';
import 'package:honkai_lab/domain/entities/weapon_stigmata_banner.dart';

class HomeProvider extends ChangeNotifier {
  int _indexServer = 0;
  int get indexServer => _indexServer;

  int _indexEvent = 0;
  int get indexEvent => _indexEvent;

  final List<ActiveCode> _codesGlobal = const [
    ActiveCode(
        code: "60AHDASFBLAFL",
        reward: "300 Crystals, 2888 Asterite, 1x SSS Trial card Option",
        isActive: true,
        server: "Global"),
    ActiveCode(
        code: "ARROWOFNOVAE ",
        reward:
            "9.999 Coins, 1x Battlesuit Trial Card Option, 1x Starless Rift",
        isActive: true,
        server: "Global"),
  ];

  List<ActiveCode> get codesGlobal => _codesGlobal;

  final List<ActiveCode> _codesSea = const [
    ActiveCode(
        code: "ARROWOFNOVAE ",
        reward:
            "9.999 Coins, 1x Battlesuit Trial Card Option, 1x Starless Rift",
        isActive: true,
        server: "Sea"),
  ];

  List<ActiveCode> get codesSea => _codesSea;

  final List<EventHonkai> _currentEvents = const [
    EventHonkai(
        title: "Estival Seaside Amusement Park",
        description:
            "When sea breezes blow through every street in summer, the whole city becomes the Estival Seaside Amusement Park! The annual Beast Tamer Championship is drawing near! Summer event [Estival Seaside Amusement Park] has opened!",
        urlImage: "https://pbs.twimg.com/media/E9IinmCVcAAFMRS.png"),
    EventHonkai(
        title: "Summer Survival Rhapsody Side 13",
        description: "Plant vs Zombie with chibi Flame Chasers",
        urlImage:
            "https://upload-os-bbs.hoyolab.com/upload/2022/09/14/1016563/6b54313ef39a670cfbc9c92c0fce6715_986478854470749386.png?x-oss-process=image/resize,s_740/quality,q_80/auto-orient,0/interlace,1/format,png"),
  ];
  List<EventHonkai> get currentEvents => _currentEvents;

  final List<EventHonkai> _ongoingEvents = const [
    EventHonkai(
        title: "Fall Guys Mode Honkai",
        description: "Fall guys mode with chibi valkyries and Flame Chasers",
        urlImage: "https://i.ibb.co/TBnkc9R/Untitled.png"),
  ];
  List<EventHonkai> get ongoingEvents => _ongoingEvents;

  final List<Update> _listUpdates = const [
    Update(
        urlWeb:
            "https://honkaiimpact3.hoyoverse.com/global/en-us/news/2118?cate=329&cateLabel=Updates",
        title: "Honkai Impact 3rd PC FAQs",
        description:
            "Ai-chan will answer them in today's episode on behalf of the HQ!",
        urlImage:
            "https://webstatic.hoyoverse.com/upload/uploadstatic/contentweb/20200113/2020011316220131916.png"),
    Update(
        urlWeb:
            "https://honkaiimpact3.hoyoverse.com/global/en-us/news/24650?cate=329&cateLabel=Updates",
        title: "Ai-chan's Newsflash: Midnight Chronicle coming soon!",
        description:
            "Hi Captains! The new event Midnight Chronicle will be available after the v6.1 update, and Jade Knight Li Sushang will be the protagonist. Now let's check out the new experience she'll bring to everyone~",
        urlImage:
            "https://webstatic.hoyoverse.com/upload/contentweb/2022/10/13/4ed9a129299220eb277926ee047893be_5591205031492660505.png"),
    Update(
        urlWeb:
            "https://honkaiimpact3.hoyoverse.com/global/en-us/news/24612?cate=329&cateLabel=Updates",
        title:
            "Ai-chan's Newsflash: New S-rank Battlesuit Jade Knight for Li Sushang Debuts",
        description:
            "As v6.1 Moonshade Epic approaches, Ai-chan returns with intel on the new battlesuit! Today's episode is all about the upcoming S-rank battlesuit Jade Knight for Li Sushang!",
        urlImage:
            "https://webstatic.hoyoverse.com/upload/contentweb/2022/10/12/04bd6fb9896551cbaffc6bfe5fb912d5_6540728168271874840.png")
  ];
  List<Update> get listUpdates => _listUpdates;

  final List<BannerCharacter> _bannerCharacters = const [
    BannerCharacter(
        urlImage:
            "https://i.ibb.co/sJYFL1d/70341a161c1b15a6d3e951d059ffaafa-removebg-preview.png",
        endDate: "13 October 2022",
        nameCharacter: "Herrscher of Thunder"),
  ];
  List<BannerCharacter> get bannerCharacters => _bannerCharacters;

  final List<ElfBanner> _elfBanners = const [
    ElfBanner(
        urlImage:
            "https://static.wikia.nocookie.net/honkaiimpact3_gamepedia_en/images/4/4c/Elf_Elysia.png/revision/latest/scale-to-width-down/488?cb=20220916070416",
        endDate: "13 October 2022",
        nameElf: "Elf Elysia"),
  ];
  List<ElfBanner> get elfBanners => _elfBanners;

  final List<WeaponStigmataBanner> _weaponStigmatasBanners = const [
    WeaponStigmataBanner(
        urlImageWeapon:
            "https://i.ibb.co/rFXFBWY/997e4f52f17-removebg-preview.png",
        urlImageStigmata: "https://i.ibb.co/ZNvyFhT/Icons-removebg-preview.png",
        endDate: "13 October 2022",
        nameStigmata: "Benares: Awakened",
        nameWeapon: "Key of Castigation"),
    WeaponStigmataBanner(
        urlImageWeapon:
            "https://static.wikia.nocookie.net/honkaiimpact3_gamepedia_en/images/a/a4/Zither%27s_Lament_%285%29.png/revision/latest/scale-to-width-down/250?cb=20220614054743",
        urlImageStigmata:
            "https://i.ibb.co/qR53XBG/Untitled-removebg-preview.png",
        endDate: "13 October 2022",
        nameStigmata: "Shuijing",
        nameWeapon: "Key of Castigation"),
  ];
  List<WeaponStigmataBanner> get weaponStigmatasBanners =>
      _weaponStigmatasBanners;

  void changeIndexServer(int index) {
    _indexServer = index;
    notifyListeners();
  }

  void changeIndexEvent(int index) {
    _indexEvent = index;
    notifyListeners();
  }
}

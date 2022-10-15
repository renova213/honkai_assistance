import 'package:flutter/cupertino.dart';
import 'package:honkai_lab/domain/entities/official_link.dart';

class AboutProvider extends ChangeNotifier {
  int _indexHeader = 0;
  int get indexHeader => _indexHeader;

  final List<OfficialLink> _officialLinksSea = const [
    OfficialLink(
        platform: "Website",
        assetIcon: "assets/globe.svg",
        url: "https://honkaiimpact3.hoyoverse.com/asia/en-us/download"),
    OfficialLink(
        platform: "Google Play",
        assetIcon: "assets/google_play.svg",
        url:
            "https://play.google.com/store/apps/details?id=com.miHoYo.bh3oversea&hl=id&gl=US"),
    OfficialLink(
        platform: "Facebook",
        assetIcon: "assets/facebook.svg",
        url:
            "https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwi46fvbrOH6AhXiAbcAHV_lBjcQFnoECBAQAQ&url=https%3A%2F%2Fwww.facebook.com%2FHonkaiImpact3rd.id%2F&usg=AOvVaw1mHakzACRw-GRNGOK_1kI1"),
    OfficialLink(
        platform: "Youtube",
        assetIcon: "assets/youtube.svg",
        url: "https://www.youtube.com/c/HonkaiImpact3rdGlobal/videos"),
    OfficialLink(
        platform: "Discord",
        assetIcon: "assets/discord.svg",
        url:
            "https://discord.com/invite/hi3?fbclid=IwAR0_qgzb6KFiWWGODbpIUV9cQ060I46GGUMOX8x8749oX6qUhRZ6rQ01fQg"),
  ];
  List<OfficialLink> get officialLinksSea => _officialLinksSea;

  final List<OfficialLink> _officialLinksGlobal = const [
    OfficialLink(
        platform: "Website",
        assetIcon: "assets/globe.svg",
        url: "https://honkaiimpact3.hoyoverse.com/global/en-us/download"),
    OfficialLink(
        platform: "Google Play",
        assetIcon: "assets/google_play.svg",
        url:
            "https://play.google.com/store/apps/details?id=com.miHoYo.bh3global&hl=id&gl=US"),
    OfficialLink(
        platform: "Facebook",
        assetIcon: "assets/facebook.svg",
        url:
            "https://www.facebook.com/global.honkaiimpact/?brand_redir=426412444588504"),
    OfficialLink(
        platform: "Youtube",
        assetIcon: "assets/youtube.svg",
        url: "https://www.youtube.com/c/HonkaiImpact3rdGlobal/videos"),
    OfficialLink(
        platform: "Steam",
        assetIcon: "assets/steam.svg",
        url: "https://store.steampowered.com/app/1671200/Honkai_Impact_3rd/"),
    OfficialLink(
        platform: "Discord",
        assetIcon: "assets/discord.svg",
        url:
            "https://discord.com/invite/hi3?fbclid=IwAR0_qgzb6KFiWWGODbpIUV9cQ060I46GGUMOX8x8749oX6qUhRZ6rQ01fQg"),
  ];
  List<OfficialLink> get officialLinksGlobal => _officialLinksGlobal;

  void changeIndexHeader(int index) {
    _indexHeader = index;
    notifyListeners();
  }
}

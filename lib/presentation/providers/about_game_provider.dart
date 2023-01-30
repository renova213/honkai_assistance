import 'package:flutter/material.dart';
import 'package:honkai_assistance/domain/entities/about_content.dart';

import '../../domain/entities/official_link.dart';

class AboutGameProvider extends ChangeNotifier {
  final List<AboutContent> _aboutContents = const [
    AboutContent(
        title: "Valkyrie",
        assetImage: "assets/lottie/1.json",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce quam nisi, gravida vel ultricies quis, ornare in quam."),
    AboutContent(
        title: "Quick Control System",
        assetImage: "assets/lottie/2.json",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce quam nisi, gravida vel ultricies quis, ornare in quam."),
    AboutContent(
        title: "Great Story",
        assetImage: "assets/lottie/3.json",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce quam nisi, gravida vel ultricies quis, ornare in quam."),
    AboutContent(
        title: "Diverse Gameplay",
        assetImage: "assets/lottie/4.json",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce quam nisi, gravida vel ultricies quis, ornare in quam."),
    AboutContent(
        title: "Challenge",
        assetImage: "assets/lottie/5.json",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce quam nisi, gravida vel ultricies quis, ornare in quam."),
  ];
  int _indexHeader = 0;
  List<AboutContent> get aboutContents => _aboutContents;
  int get indexHeader => _indexHeader;

  final List<OfficialLink> _officialLinksSea = const [
    OfficialLink(
        platform: "Website",
        assetIcon: "assets/icons/globe.svg",
        url: "https://honkaiimpact3.hoyoverse.com/asia/en-us/download"),
    OfficialLink(
        platform: "Google Play",
        assetIcon: "assets/icons/google_play.svg",
        url:
            "https://play.google.com/store/apps/details?id=com.miHoYo.bh3oversea&hl=id&gl=US"),
    OfficialLink(
        platform: "Facebook",
        assetIcon: "assets/icons/facebook.svg",
        url:
            "https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwi46fvbrOH6AhXiAbcAHV_lBjcQFnoECBAQAQ&url=https%3A%2F%2Fwww.facebook.com%2FHonkaiImpact3rd.id%2F&usg=AOvVaw1mHakzACRw-GRNGOK_1kI1"),
    OfficialLink(
        platform: "Youtube",
        assetIcon: "assets/icons/youtube.svg",
        url: "https://www.youtube.com/c/HonkaiImpact3rdGlobal/videos"),
    OfficialLink(
        platform: "Discord",
        assetIcon: "assets/icons/discord.svg",
        url:
            "https://discord.com/invite/hi3?fbclid=IwAR0_qgzb6KFiWWGODbpIUV9cQ060I46GGUMOX8x8749oX6qUhRZ6rQ01fQg"),
  ];
  final List<OfficialLink> _officialLinksGlobal = const [
    OfficialLink(
        platform: "Website",
        assetIcon: "assets/icons/globe.svg",
        url: "https://honkaiimpact3.hoyoverse.com/global/en-us/download"),
    OfficialLink(
        platform: "Google Play",
        assetIcon: "assets/icons/google_play.svg",
        url:
            "https://play.google.com/store/apps/details?id=com.miHoYo.bh3global&hl=id&gl=US"),
    OfficialLink(
        platform: "Facebook",
        assetIcon: "assets/icons/facebook.svg",
        url:
            "https://www.facebook.com/global.honkaiimpact/?brand_redir=426412444588504"),
    OfficialLink(
        platform: "Youtube",
        assetIcon: "assets/icons/youtube.svg",
        url: "https://www.youtube.com/c/HonkaiImpact3rdGlobal/videos"),
    OfficialLink(
        platform: "Steam",
        assetIcon: "assets/icons/steam.svg",
        url: "https://store.steampowered.com/app/1671200/Honkai_Impact_3rd/"),
    OfficialLink(
        platform: "Discord",
        assetIcon: "assets/icons/discord.svg",
        url:
            "https://discord.com/invite/hi3?fbclid=IwAR0_qgzb6KFiWWGODbpIUV9cQ060I46GGUMOX8x8749oX6qUhRZ6rQ01fQg"),
  ];

  List<OfficialLink> get officialLinksSea => _officialLinksSea;
  List<OfficialLink> get officialLinksGlobal => _officialLinksGlobal;

  void changeIndexHeader(int index) {
    _indexHeader = index;
    notifyListeners();
  }
}

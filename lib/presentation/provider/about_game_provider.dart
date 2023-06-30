import 'package:flutter/material.dart';

class AboutGameProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _aboutContents = [
    {
      "title": "Official Description",
      "assetImage": "assets/lottie/1.json",
      "description":
          '''Honkai Impact 3rd is a next-gen 3D cel-shaded anime action game. Experience epic stories and intense battles with Valkyries!
Honkai is the shadow of civilization that aims to exterminate it. The Will of Honkai grew with civilization until it wished to inhibit its progress, and thus created Herrschers, humanoid beings that possess unthinkable strength. To resist Honkai and save our home, you will assume the role of a Captain who commands a memorable cast of Valkyries. The bonds you forge will become your greatest weapon against Honkai!'''
    },
    {
      "title": "Hard-hitting Combo Action",
      "assetImage": "assets/lottie/2.json",
      "description":
          "Your skills will bring out the full potential of powerful Valkyries! Combine their large movesets and you will be playing with endless combo possibilities!"
    },
    {
      "title": "Immersive Stories",
      "assetImage": "assets/lottie/3.json",
      "description":
          "The ongoing Honkai stories are told through top-notch gameplay, cinematics, and voice acting! You can become anyone on the battlefield!"
    },
    {
      "title": "Diverse Gameplay",
      "assetImage": "assets/lottie/4.json",
      "description":
          "Ranging from mini-games like racing and shmup to full-scale expansions like twin-stick shooter and open-world adventure, there are tons of ways to play!"
    },
    {
      "title": "Heated Co-op",
      "assetImage": "assets/lottie/5.json",
      "description":
          "Team up with other players to solve puzzles and defeat bosses! You can even form an Armada with friends to confront Honkai together... on a bigger scale!"
    },
  ];
  final List<Map<String, dynamic>> _officialLinksSea = [
    {
      "platform": "Website",
      "assetIcon": "assets/icons/globe.svg",
      "url": "https://honkaiimpact3.hoyoverse.com/asia/en-us/download"
    },
    {
      "platform": "Google Play",
      "assetIcon": "assets/icons/google_play.svg",
      "url":
          "https://play.google.com/store/apps/details?id=com.miHoYo.bh3oversea&hl=id&gl=US"
    },
    {
      "platform": "Facebook",
      "assetIcon": "assets/icons/facebook.svg",
      "url": "https://www.facebook.com/HonkaiImpact3rd.id/"
    },
    {
      "platform": "Youtube",
      "assetIcon": "assets/icons/youtube.svg",
      "url": "https://www.youtube.com/c/HonkaiImpact3rdGlobal/videos"
    },
    {
      "platform": "Discord",
      "assetIcon": "assets/icons/discord.svg",
      "url":
          "https://discord.com/invite/hi3?fbclid=IwAR0_qgzb6KFiWWGODbpIUV9cQ060I46GGUMOX8x8749oX6qUhRZ6rQ01fQg"
    },
  ];
  final List<Map<String, dynamic>> _officialLinksGlobal = [
    {
      "platform": "Website",
      "assetIcon": "assets/icons/globe.svg",
      "url": "https://honkaiimpact3.hoyoverse.com/global/en-us/download"
    },
    {
      "platform": "Google Play",
      "assetIcon": "assets/icons/google_play.svg",
      "url":
          "https://play.google.com/store/apps/details?id=com.miHoYo.bh3global&hl=id&gl=US"
    },
    {
      "platform": "Facebook",
      "assetIcon": "assets/icons/facebook.svg",
      "url": "https://www.facebook.com/global.honkaiimpact/"
    },
    {
      "platform": "Youtube",
      "assetIcon": "assets/icons/youtube.svg",
      "url": "https://www.youtube.com/c/HonkaiImpact3rdGlobal/videos"
    },
    {
      "platform": "Steam",
      "assetIcon": "assets/icons/steam.svg",
      "url": "https://store.steampowered.com/app/1671200/Honkai_Impact_3rd/"
    },
    {
      "platform": "Discord",
      "assetIcon": "assets/icons/discord.svg",
      "url":
          "https://discord.com/invite/hi3?fbclid=IwAR0_qgzb6KFiWWGODbpIUV9cQ060I46GGUMOX8x8749oX6qUhRZ6rQ01fQg"
    }
  ];
  int _indexHeader = 0;

  int get indexHeader => _indexHeader;
  List<Map<String, dynamic>> get officialLinksSea => _officialLinksSea;
  List<Map<String, dynamic>> get officialLinksGlobal => _officialLinksGlobal;
  List<Map<String, dynamic>> get aboutContents => _aboutContents;

  Future<void> changeIndexHeader(int index) async {
    _indexHeader = index;
    notifyListeners();
  }
}

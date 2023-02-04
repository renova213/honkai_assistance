import '../../entities/official_link.dart';

class OfficialLinkGlobalUsecase {
  Future<List<OfficialLink>> call() async {
    const List<OfficialLink> officialLinksGlobal = [
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
    return officialLinksGlobal;
  }
}

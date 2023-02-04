import '../../entities/official_link.dart';

class OfficialLinkSeaUsecase {
  Future<List<OfficialLink>> call() async {
    const List<OfficialLink> officialLinksSea = [
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
    return officialLinksSea;
  }
}

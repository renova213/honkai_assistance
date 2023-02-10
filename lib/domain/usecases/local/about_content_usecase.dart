import '../../entities/about_content.dart';

class AboutContentUsecase {
  Future<List<AboutContent>> call() async {
    const List<AboutContent> aboutContents = [
      AboutContent(
          title: "Official Description",
          assetImage: "assets/lottie/1.json",
          description:
              '''Honkai Impact 3rd is a next-gen 3D cel-shaded anime action game. Experience epic stories and intense battles with Valkyries!
Honkai is the shadow of civilization that aims to exterminate it. The Will of Honkai grew with civilization until it wished to inhibit its progress, and thus created Herrschers, humanoid beings that possess unthinkable strength. To resist Honkai and save our home, you will assume the role of a Captain who commands a memorable cast of Valkyries. The bonds you forge will become your greatest weapon against Honkai!'''),
      AboutContent(
          title: "Hard-hitting Combo Action",
          assetImage: "assets/lottie/2.json",
          description:
              "Your skills will bring out the full potential of powerful Valkyries! Combine their large movesets and you will be playing with endless combo possibilities!"),
      AboutContent(
          title: "Immersive Stories",
          assetImage: "assets/lottie/3.json",
          description:
              "The ongoing Honkai stories are told through top-notch gameplay, cinematics, and voice acting! You can become anyone on the battlefield!"),
      AboutContent(
          title: "Diverse Gameplay",
          assetImage: "assets/lottie/4.json",
          description:
              "Ranging from mini-games like racing and shmup to full-scale expansions like twin-stick shooter and open-world adventure, there are tons of ways to play!"),
      AboutContent(
          title: "Heated Co-op",
          assetImage: "assets/lottie/5.json",
          description:
              "Team up with other players to solve puzzles and defeat bosses! You can even form an Armada with friends to confront Honkai together... on a bigger scale!"),
    ];
    return aboutContents;
  }
}

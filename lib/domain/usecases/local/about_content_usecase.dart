import '../../entities/about_content.dart';

class AboutContentUsecase {
  Future<List<AboutContent>> call() async {
    const List<AboutContent> aboutContents = [
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
    return aboutContents;
  }
}

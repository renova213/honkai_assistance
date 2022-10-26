import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:honkai_lab/common/style.dart';
import 'package:honkai_lab/presentation/providers/about_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutGamePage extends StatelessWidget {
  const AboutGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(
        width * 0.05,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text("About the game", style: headline6),
          const SizedBox(height: 8),
          Text("Learn more about Honkai Impact 3rd", style: bodyText1),
          const SizedBox(height: 32),
          _titleContainer("Honkai Impact 3rd"),
          const SizedBox(height: 16),
          Text(
            '''Honkai Impact 3rd is a free-to-play 3D action role-playing game (originally a mobile exclusive) developed and published by miHoYo, and later ported to Microsoft Windows.
It is the spiritual successor to Houkai Gakuen 2, using many characters from the previous title in a separate story.
The game is notable for incorporating a variety of genres, from hack and slash and social simulation, to elements of bullet hell, platforming, shoot 'em up and dungeon crawling across multiple single and multiplayer modes. It features gacha mechanics.''',
            style: bodyText2,
          ),
          const SizedBox(height: 32),
          _titleContainer("Official Description"),
          const SizedBox(height: 16),
          Text(
            '''Honkai Impact 3rd is a next-gen 3D cel-shaded anime action game. Experience epic stories and intense battles with Valkyries!
Honkai is the shadow of civilization that aims to exterminate it. The Will of Honkai grew with civilization until it wished to inhibit its progress, and thus created Herrschers, humanoid beings that possess unthinkable strength. To resist Honkai and save our home, you will assume the role of a Captain who commands a memorable cast of Valkyries. The bonds you forge will become your greatest weapon against Honkai!''',
            style: bodyText2,
          ),
          const SizedBox(height: 16),
          LottieBuilder.asset("assets/1.json", width: width, height: 150),
          const SizedBox(height: 16),
          Text(
            '''Main Features:
✦ Hard-hitting Combo Action
Your skills will bring out the full potential of powerful Valkyries! Combine their large movesets and you will be playing with endless combo possibilities!''',
            style: bodyText2,
          ),
          const SizedBox(height: 16),
          LottieBuilder.asset("assets/2.json", width: width, height: 150),
          const SizedBox(height: 16),
          Text(
            "✦ Immersive Stories",
            style: bodyText2.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            "The ongoing Honkai stories are told through top-notch gameplay, cinematics, and voice acting! You can become anyone on the battlefield!",
            style: bodyText2,
          ),
          const SizedBox(height: 16),
          LottieBuilder.asset("assets/3.json", width: width, height: 150),
          const SizedBox(height: 16),
          Text(
            "✦ Diverse Gameplay",
            style: bodyText2.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            "Ranging from mini-games like racing and shmup to full-scale expansions like twin-stick shooter and open-world adventure, there are tons of ways to play!",
            style: bodyText2,
          ),
          const SizedBox(height: 16),
          LottieBuilder.asset("assets/4.json", width: width, height: 150),
          const SizedBox(height: 16),
          Text(
            "✦ Heated Co-op",
            style: bodyText2.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            "Team up with other players to solve puzzles and defeat bosses! You can even form an Armada with friends to confront Honkai together... on a bigger scale!",
            style: bodyText2,
          ),
          const SizedBox(height: 16),
          LottieBuilder.asset("assets/5.json", width: width, height: 150),
          const SizedBox(height: 16),
          Text(
              "Join Honkai Impact 3rd to fight for all that is beautiful in the world!",
              style: bodyText2),
          const SizedBox(height: 32),
          _titleContainer("Official links"),
          const SizedBox(height: 16),
          _headerOfficialServer(),
          const SizedBox(height: 16),
          _listLinkOfficialServer(),
          const SizedBox(height: 16),
          _titleContainer("PC Client"),
          const SizedBox(height: 16),
          Text(
              "Honkai Impact 3 has an official PC client, so you don't have to use emulators to play the game on PC. You can find links to download the PC client on the official website for each region. For Steam only available on global server",
              style: bodyText2),
          const SizedBox(height: 16),
          _titleContainer("Conclusion "),
          const SizedBox(height: 16),
          Text(
              "Overall, Honkai Impact 3rd is a long-term game that has been going strong for 5 years, and it's only going to get even better! The game may be a bit confusing for new players, but rest assured, we were all equally lost when we just started as well~ Take your time, enjoy the story, and everything will be fine :D",
              style: bodyText2),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _titleContainer(String title) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          height: 50,
          decoration: const BoxDecoration(
            color: Colors.transparent,
            border: Border(
              bottom: BorderSide(color: Colors.blue, width: 3),
            ),
          ),
          child: Text(title, style: subtitle),
        ),
        Expanded(
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade700, width: 1),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _headerOfficialServer() {
    return Consumer<AboutProvider>(
      builder: (context, notifier, _) => Row(
        children: [
          InkWell(
            onTap: () => notifier.changeIndexHeader(0),
            child: Container(
              alignment: Alignment.center,
              height: 40,
              width: 90,
              decoration: BoxDecoration(
                color: notifier.indexHeader == 0
                    ? Colors.grey.withOpacity(0.5)
                    : Colors.grey.withOpacity(0.1),
                border: Border(
                  bottom: notifier.indexHeader == 0
                      ? const BorderSide(color: Colors.blue, width: 3)
                      : BorderSide(color: Colors.grey.shade700, width: 1),
                ),
              ),
              child: Text(
                "SEA",
                style: bodyText2.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(width: 3),
          InkWell(
            onTap: () => notifier.changeIndexHeader(1),
            child: Container(
              height: 40,
              width: 90,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: notifier.indexHeader == 1
                    ? Colors.grey.withOpacity(0.5)
                    : Colors.grey.withOpacity(0.1),
                border: Border(
                  bottom: notifier.indexHeader == 1
                      ? const BorderSide(color: Colors.blue, width: 3)
                      : BorderSide(color: Colors.grey.shade700, width: 1),
                ),
              ),
              child: Text("Global", style: bodyText2),
            ),
          ),
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade700, width: 1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _listLinkOfficialServer() {
    return Consumer<AboutProvider>(
      builder: (context, notifier, _) => ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: notifier.indexHeader == 0
            ? notifier.officialLinksSea.length
            : notifier.officialLinksGlobal.length,
        itemBuilder: (context, index) {
          final data = notifier.indexHeader == 0
              ? notifier.officialLinksSea[index]
              : notifier.officialLinksGlobal[index];

          return _officialLinkItems(
              assetIcon: data.assetIcon,
              platform: data.platform,
              url: data.url);
        },
      ),
    );
  }

  Widget _officialLinkItems(
      {required String assetIcon,
      required String platform,
      required String url}) {
    return SizedBox(
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(assetIcon,
                  width: 20, height: 20, color: Colors.white),
              const SizedBox(width: 8),
              Text(platform, style: bodyText2),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.open_in_browser, color: Colors.blue, size: 20),
              const SizedBox(width: 8),
              InkWell(
                onTap: () {
                  _launchUrl(url);
                },
                child: Text(
                  "Open in Browser",
                  style: bodyText2.copyWith(color: Colors.blue),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _launchUrl(String url) async {
    try {
      await launchUrl(
        Uri.parse(url),
      );
    } catch (_) {
      throw "couldn't launch this url";
    }
  }
}

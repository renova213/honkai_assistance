import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:honkai_lab/responsive_layout.dart';

import '../../../../common/style.dart';

class BeginnerGuidePage extends StatelessWidget {
  const BeginnerGuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.black87,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Scrollbar(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Text("Beginner Guide", style: headline6),
                    const SizedBox(height: 8),
                    Text(
                        "Everything you need to know as a new Honkai Impact 3 player.",
                        style: bodyText1),
                    const SizedBox(height: 16),
                    _titleContainer("About Honkai Impact 3"),
                    const SizedBox(height: 16),
                    Text(
                        '''Honkai Impact 3rd is a free-to-play 3D action role-playing game (originally a mobile exclusive) developed and published by miHoYo, and later ported to Microsoft Windows.
              
It is the spiritual successor to Houkai Gakuen 2, using many characters from the previous title in a separate story.
              
The game is notable for incorporating a variety of genres, from hack and slash and social simulation, to elements of bullet hell, platforming, shoot 'em up and dungeon crawling across multiple single and multiplayer modes. It features gacha mechanics.''',
                        style: bodyText2),
                    const SizedBox(height: 16),
                    _titleContainer("Frequently Asked Questions"),
                    const SizedBox(height: 16),
                    _customText("1. Is this game Free to Play friendly?",
                        "Yes. As long as you don't compate in challange stage like abyss or memorial arena, because it depends on how well you build your meta character, Thankfully, the rewards difference between the bottom and top ranks is really small.\n\nFurthermore, the game has amazing story and short animation on every important story."),
                    const SizedBox(height: 12),
                    _customText("2. How do the rates of gacha look like?", '''
Specific Rates :
- S Rank : 1.50%
- A Rank : 13.50%
- B Rank : 5.50%
            
You will get an S rank battlesuit within every 100 pulls and the pity counter will carry over for banners of the same type like Expansion. The rates will stay constant the whole way from your first pull to your 99th and on your 100th you are guaranteed the up rate.'''),
                    const SizedBox(height: 16),
                    _customText(
                        "3. Is GGZ (Honkai Gakuen 2) related to Honkai Impact 3rd?",
                        "No, they’re completely separate universes."),
                    const SizedBox(height: 16),
                    _customText("4. When does chapter 1 take place?",
                        "Game chapter 1 takes place in July of 2016."),
                    const SizedBox(height: 16),
                    _customText("5. What’s a Herrscher?",
                        "A Herrscher is a human chosen by the Honkai to wield powers and destroy humanity."),
                    const SizedBox(height: 16),
                    _titleContainer("Advantage Type"),
                    const SizedBox(height: 16),
                    _advantageType(),
                    const SizedBox(height: 16),
                    _titleContainer("Gameplay"),
                    const SizedBox(height: 16),
                    _gameplay(
                        text: "1. Story Stages",
                        text2:
                            "In this story stage, you will introduced to many characters, there are Raiden Mei, Bronya Zaychik, Fu Hua, Himeko Murata and many others. In this stage, you can see the struggle of Kiana and her friends to stop Honkai together.",
                        urlImage: "https://i.ibb.co/1Gm4xKT/1.png",
                        width: width,
                        context: context),
                    const SizedBox(height: 16),
                    _gameplay(
                        text: "2. Chronicles",
                        text2:
                            "Chronicles are side-stories about past events, or side stories that happen alongside the main story, but aren't featured. For example, one of the Chronicles shows Theresa's past and upbringing, were we can learn about her origin and backstory.",
                        urlImage: "https://i.ibb.co/3M65gxD/2.png",
                        width: width,
                        context: context),
                    const SizedBox(height: 16),
                    _gameplay(
                        text: "3. Open world",
                        text2:
                            "Open World is a large place, you can walk around in these places. Open World also has quests that are no less interesting. But it requires a lot of stamina. In Open World, there are 3 map variants that you can choose from. There are Sakura Samsara, Schicksal HQ, and APHO (A Post Honkai Odyssey).",
                        urlImage: "https://i.ibb.co/7YRxzDM/3.png",
                        width: width,
                        context: context),
                    const SizedBox(height: 16),
                    _gameplay(
                        text: "4. Daily Material Stages",
                        text2:
                            "Here is where you can perform daily stages to get upgrade materials and fulfill your daily task requirements. The stages here are pretty straightforward, and there's a instant-clear button for stages that you've completed before. Super convenient for everyone.",
                        urlImage: "https://i.ibb.co/FDSmMKp/4.png",
                        width: width,
                        context: context),
                    const SizedBox(height: 16),
                    _gameplay(
                        text: "5. Infinity Abyss",
                        text2:
                            "The first 'PVP' element, where you compete against other other valkyries in completing as many stages as fast as possible. Infinity Abyss puts your valkyries to the test, as you attempt to clear stages that become progressively more difficult. This mode runs twice a week, Monday and Friday, where you'll be able to earn crystals from trying at the stage at least once!.",
                        urlImage: "https://i.ibb.co/LpCNq0H/5.png",
                        width: width,
                        context: context),
                    const SizedBox(height: 16),
                    _gameplay(
                        text: "6. Memorial Arena",
                        text2:
                            "The next 'PVP' element, where you'll be given 3 bosses to fight. The catch is that your valkyries and equipment can only be used once per boss, thus putting your team composition skills to the test. In the beginning you may have a lack of valkyries to clear all the bosses efficiently, but my advice to do at least 10 attempts each week to clear the weekly attempts reward.",
                        urlImage: "https://i.ibb.co/TvfptBH/6.png",
                        width: width,
                        context: context),
                    const SizedBox(height: 16),
                    _gameplay(
                        text: "7. Universal Mirage",
                        text2:
                            "Universal Mirage provides you with crafting materials that allow you forge valkyrie-specific Weapons and Stigmatas for your valkyries to use. There are 4 elements to choose from (Ice, Fire, Lightning and Physical), and each section consists of 6 levels that get progressively more difficult, but provide better rewards.",
                        urlImage: "https://i.ibb.co/2MVbYsF/7.png",
                        width: width,
                        context: context),
                    const SizedBox(height: 16),
                    _gameplay(
                        text: "8. Coop Stage",
                        text2:
                            "Coop Raid is a stage where you can get divine keys or materials according to the stage you choose. For the divine key stage, you can choose the left one. If you choose material, you can choose the right one. You can complete this stage if there are 3 people in your party, if there are less than 3 people then you have to wait for someone else to enter your party.",
                        urlImage:
                            "https://i.ytimg.com/vi/fNhJMzhp0as/maxresdefault.jpg",
                        width: width,
                        context: context),
                    const SizedBox(height: 16),
                    _titleContainer("Cadet-Sensei System"),
                    const SizedBox(height: 16),
                    _gameplay(
                        text: "1. Cadet-Sensei Tasks",
                        text2:
                            "Coop Raid is a stage where you can get divine keys or materials according to the stage you choose. For the divine key stage, you can choose the left one. If you choose material, you can choose the right one. You can complete this stage if there are 3 people in your party, if there are less than 3 people then you have to wait for someone else to enter your party.",
                        urlImage:
                            "https://preview.redd.it/6ynejba41ad41.jpg?auto=webp&s=bd5cb7de7d4db24abd021042369347f20da51442",
                        width: width,
                        context: context),
                    const SizedBox(height: 16),
                    _gameplay(
                        text: "2. Q&A",
                        text2:
                            "''Ask and you shall receive''. If there's anything that you're not sure of, be-it game mechanics, gear investments or storyline stuff, don't be afraid to hit your sensei up! I'm sure your sensei would be glad to help, and y'all might even become friends! Honkai is so much more fun when there's friends around amirite?",
                        urlImage:
                            "https://interfaceingame.com/wp-content/uploads/honkai-impact-3rd/honkai-impact-3rd-sensei-cadet.png",
                        width: width,
                        context: context),
                    const SizedBox(height: 16),
                    _titleContainer("Additional"),
                    const SizedBox(height: 16),
                    _customText(
                        "1. Avoid unlocking/upgrading your Valkyrie’s Switch Skills",
                        " This is strongly recommended to players planning to join the competitive scene. Switch skills tend to lessen the synergy of your valkyries’ stigmatas. If you want to maximize your valkyrie’s capabilities especially during late game, then a good practice would be to avoid unlocking/upgrading switch skills."),
                    const SizedBox(height: 8),
                    _customText("2. Standard Gacha is a scam, don't pull on it",
                        "There are three primary Gacha rolls in this game: Standard, Focus and Expansion. Standard is basically the largest pool of units/weapons and junk and hence if you are aiming for something, this would not be the one to use. Focus are for Stigma's and Weapons only and is the most recommended place to pull because this is where the bulk of the power of the Valkyrie's come from. Expansion typically will hold specific units on ''rate up'' or Limited Edition Units and Weapons. Only roll on Expansion if you are aiming for specific units that typically can't be acquired via grinding."),
                    const SizedBox(height: 8),
                    _customText("3. Never use experience chips",
                        "As much as possible, keep your level low. Instead of focusing on leveling up, focus on upgrading your valkyrie’s level. Make sure you check out the Valkyrie Farming Guide to check which valkyrie’s to prioritize on upgrading."),
                    const SizedBox(height: 8),
                    _customText("4. Join an Armada",
                        "A max level Tier V Armada is a recommended Armada that you should join. Once you are in an Armada, make sure you stay active and contribute to the Armada Missions. The Dailies should guide you on which Armada Missions you have not completed yet."),
                    const SizedBox(height: 8),
                    _customText("5. Find a Sensei",
                        "Having a sensei will unlock Sensei Missions. Sensei Missions offers great rewards upon completion. Finding a sensei should be easy so you won’t need to worry about it."),
                    const SizedBox(height: 8),
                    _customText("6. Don’t let your stamina overflow",
                        "If you let your stamina reach max, the stamina accumulation will slow down. Make sure your stamina bar is not full to maximize stamina accumulation."),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _customText(String text1, String text2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text1,
          style: bodyText2.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Text(text2, style: bodyText2),
      ],
    );
  }

  Widget _titleContainer(String title) {
    return Row(
      children: [
        Container(
          alignment: Alignment.centerLeft,
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

  Widget _advantageType() {
    return Column(
      children: [
        SizedBox(
          height: 150,
          width: 200,
          child: Image.network(
              "https://static.wikia.nocookie.net/a70fa1b5-233f-46d0-9d5b-2e09fb91de9d"),
        ),
        Text(
            "Mech is weak against psyh, but excels with bio.  psyh is strong against mech, but weak against bio.  and bio is weak against mech, but strong against psyh. ",
            style: bodyText2),
        const SizedBox(height: 8),
        Text(
            "different from others, quantum and imaginary types are only superior, weak at the same time to their types and excels with each others.",
            style: bodyText2),
      ],
    );
  }

  Widget _gameplay(
      {required String text,
      required String text2,
      required String urlImage,
      required double width,
      required BuildContext context}) {
    return Column(
      children: [
        _customText(text, text2),
        const SizedBox(height: 8),
        SizedBox(
          height: ResponsiveLayout.isMobile(context) ? 150 : 200,
          width: width * 0.7,
          child: CachedNetworkImage(
            imageUrl: urlImage,
            errorWidget: (context, url, error) {
              return const Center(
                child: Icon(Icons.error, color: Colors.red),
              );
            },
            placeholder: (context, url) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}

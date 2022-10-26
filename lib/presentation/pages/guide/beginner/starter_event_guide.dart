import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:honkai_lab/responsive_layout.dart';

import '../../../../common/style.dart';

class StarterEventPage extends StatelessWidget {
  const StarterEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black87),
      body: Container(
        color: Colors.black87,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Scrollbar(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Text("Starter Event", style: headline6),
                  const SizedBox(height: 8),
                  Text(
                      "The Starter's Event is available to new Captains for 60 days after account creation and is visible after clearing Chapter 1-5. It was added in version 4.5.",
                      style: bodyText1),
                  const SizedBox(height: 16),
                  _customWidget(
                      text: "1. Path to Greatness",
                      text2:
                          "Path to Greatness is the generic account progression tasks that have simple tasks, but these tasks provide HUGE rewards such as crystals and dorm supply cards! Definitely worth doing due to its simplicity and high returns!.",
                      urlImage:
                          "https://upload-os-bbs.hoyolab.com/upload/2021/12/13/5434195/ba746d3027b027f298b6e4ede840bb2d_4124690921005257416.jpg?x-oss-process=image/resize,s_740/quality,q_80/auto-orient,0/interlace,1/format,jpg",
                      width: width,
                      context: context),
                  const SizedBox(height: 16),
                  _customWidget(
                      text: "2. Level-up Sprint",
                      text2:
                          "Level up Sprint provides you with more crystals and dorm supply ticket rewards for every 5 to 10 captain levels. There are no tasks associated with this, with the only requirements being the Captain level!.",
                      urlImage:
                          "https://upload-os-bbs.hoyolab.com/upload/2021/12/14/5434195/1dcccf1b4bea9eedf580ba93b7ef0d8b_8667659704449747484.jpg?x-oss-process=image/resize,s_740/quality,q_80/auto-orient,0/interlace,1/format,jpg",
                      width: width,
                      context: context),
                  const SizedBox(height: 16),
                  _customWidget(
                      text: "3. Growth Boost",
                      text2:
                          "Want to enjoy the Gacha-experience without spending crystals? Growth boost contains a series of tasks that provides Growth Supply Tickets, and these tickets are used to pull rewards from the Growth Supply. The growth supply contains good early-game stigmata, valkyrie fragments and crystals, which are very helpful for your account progression! Do take note that some tasks in the growth supply refresh daily, while other tasks are cumulative-based.",
                      urlImage:
                          "https://upload-os-bbs.hoyolab.com/upload/2021/12/13/5434195/6fda94df043aeeedd1b93b581a92c262_5692038842145679307.jpg?x-oss-process=image/resize,s_740/quality,q_80/auto-orient,0/interlace,1/format,jpg",
                      width: width,
                      context: context),
                  const SizedBox(height: 16),
                  _customWidget(
                      text: "4. Beginner Shop",
                      text2:
                          "Under the Growth Boost tab is a Beginner Shop option that sells upgrade materials, fragments and more. The shop resets everyday and the prices of the items are insanely cheap, so do clear the shop everyday if possible!.",
                      urlImage:
                          "https://upload-os-bbs.hoyolab.com/upload/2021/12/13/5434195/54b87d65411189d6b53ac915a8bb470b_5897683756664822282.jpg?x-oss-process=image/resize,s_740/quality,q_80/auto-orient,0/interlace,1/format,jpg",
                      width: width,
                      context: context),
                  _customWidget(
                      text: "5. Daily Prep",
                      text2:
                          "Your daily warm-up with Honkai, also known as the daily prep stage. Daily prep stages can be done 3 times a day, and provide good rewards. New stages get unlocked every 5 to 10 levels, each with increasing difficulty and better rewards. With high returns from clearing the stage, doing these stages daily is a must!.",
                      urlImage:
                          "https://upload-os-bbs.hoyolab.com/upload/2021/12/13/5434195/d19a1329a2c84368c2766f657f75de3d_1165737682367287542.jpg?x-oss-process=image/resize,s_740/quality,q_80/auto-orient,0/interlace,1/format,jpg",
                      width: width,
                      context: context),
                  const SizedBox(height: 16),
                  _customWidget(
                      text: "6. Starter Supply",
                      text2:
                          "Your very first valkyrie banner! The starter supply gives a 50/50 S-rank valkyrie, where you can get either Herrscher of Flamescrion (HoF) or Herrscher of Sentience (HoS). HoF is a high-end Fire DPS valkyrie, while HoS is one of the best physical supports in the game. Both valkyries are excellent to have, but overtime they may be phased out, so I would suggest on saving your crystals for a more current valkyries.",
                      urlImage: "https://i.ibb.co/58tDD5Y/3.png",
                      width: width,
                      context: context),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
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

  Widget _customWidget(
      {required String text,
      required String text2,
      required String urlImage,
      required double width,
      required BuildContext context}) {
    return Column(
      children: [
        _titleContainer(text),
        const SizedBox(height: 16),
        Text(text2, style: bodyText2),
        const SizedBox(height: 16),
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

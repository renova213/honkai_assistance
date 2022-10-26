import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:honkai_lab/responsive_layout.dart';

import '../../../../common/style.dart';

class DormPage extends StatelessWidget {
  const DormPage({super.key});

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
                    Text("Dorm", style: headline6),
                    const SizedBox(height: 8),
                    Text(
                        "Dorm is a place for your valks to chill and hangout, providing you with non-combat content and interactions with your favourite valkyries!.",
                        style: bodyText1),
                    const SizedBox(height: 16),
                    _customWidget(
                        text: "1. Dorm Errands",
                        text2:
                            "What makes a true valkyrie is of course, CHORES... Dorm errands is where you can send your valks off to do some cleaning, shopping and groceries, which provide you good rewards. Doing chores uses a different form of stamina called Onigiri, as the doing chores make your valks hungry~.",
                        urlImage:
                            "https://upload-os-bbs.hoyolab.com/upload/2021/12/13/5434195/936ab0438e7bda194a8c4b91238baf83_1825108628567889960.png?x-oss-process=image/resize,s_740/quality,q_80/auto-orient,0/interlace,1/format,png",
                        width: width,
                        context: context),
                    const SizedBox(height: 16),
                    _customWidget(
                        text: "2. Dorm Expedition",
                        text2:
                            "Not enough time to play Honkai? Dorm Expedition is just for you! It allows valks to clear story stages off-screen and you'll be able to collect the rewards after you're back from a busy day. In the beginning where you're doing a lot of story stages, you will not really need to do Dorm expeditions, thus saving stamina. However, once you're busy or have played through all the story stages, then doing dorm expeditions to fulfill your daily task is the way to go!.",
                        urlImage:
                            "https://upload-os-bbs.hoyolab.com/upload/2021/12/13/5434195/515ca5a30c7b252b0a83a4e3f03252b0_54661603295521680.png?x-oss-process=image/resize,s_740/quality,q_80/auto-orient,0/interlace,1/format,png",
                        width: width,
                        context: context),
                    const SizedBox(height: 16),
                    _customWidget(
                        text: "3. Dorm Misc",
                        text2:
                            "The dorm has 2 machines that generate coins and store excess stamina. Do remember to collect your coins daily and excess stamina whenever you are in need of them!.",
                        urlImage:
                            "https://upload-os-bbs.hoyolab.com/upload/2021/12/13/5434195/47fdb5520fa0a725e51b7f87a75f28be_4533113488401630427.jpg?x-oss-process=image/resize,s_740/quality,q_80/auto-orient,0/interlace,1/format,jpg",
                        width: width,
                        context: context),
                    const SizedBox(height: 16),
                    _customWidget(
                        text: "4. Valkyrie Dorm",
                        text2:
                            "It's a place where you can express your own style, or enjoy the cute interactions between the Chibis. It however, also has a level system, required materials and a Tier system based on comfort.",
                        urlImage: "https://i.ibb.co/LS49VFC/Untitled.png",
                        width: width,
                        context: context),
                    const SizedBox(height: 16),
                  ]),
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

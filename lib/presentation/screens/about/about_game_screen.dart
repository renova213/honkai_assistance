import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/style/font_style.dart';
import '../../components/explanatory_container.dart';
import 'child/about_childs.dart';

class AboutGameScreen extends StatelessWidget {
  const AboutGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("About the game", style: AppFont.headline6),
          SizedBox(height: 8.h),
          Text("Learn more about Honkai Impact 3rd", style: AppFont.largeText),
          SizedBox(height: 24.h),
          const ExplanatoryContainer(
              title: "Honkai Impact 3",
              description:
                  '''Honkai Impact 3rd is a free-to-play 3D action role-playing game (originally a mobile exclusive) developed and published by miHoYo.
The game is notable for incorporating a variety of genres, from hack and slash and social simulation, to elements of bullet hell, platforming, shoot 'em up and dungeon crawling across multiple single and multiplayer modes. It features gacha mechanics.'''),
          SizedBox(height: 24.h),
          const ListAboutContent(),
          SizedBox(height: 24.h),
          const OfficialLinks(),
        ],
      ),
    );
  }
}

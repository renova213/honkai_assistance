import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/presentation/providers/about_game_provider.dart';
import 'package:honkai_assistance/presentation/screens/about/child/about_container.dart';
import 'package:honkai_assistance/presentation/screens/about/child/official_links.dart';
import 'package:provider/provider.dart';

import '../../../common/style/font_style.dart';
import '../../widgets/explanatory_container.dart';

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
          _listAboutContent(),
          SizedBox(height: 24.h),
          const OfficialLinks(),
        ],
      ),
    );
  }

  Consumer _listAboutContent() {
    return Consumer<AboutGameProvider>(
      builder: (context, notifier, _) => ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final data = notifier.aboutContents[index];
            return AboutContainer(
                title: data.title,
                description: data.description,
                assetImage: data.assetImage);
          },
          separatorBuilder: (context, index) => SizedBox(height: 16.h),
          itemCount: notifier.aboutContents.length),
    );
  }
}

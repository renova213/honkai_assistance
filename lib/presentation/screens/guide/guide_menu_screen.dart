import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/presentation/components/title_line.dart';
import 'package:provider/provider.dart';

import '../../../common/style/style.dart';
import '../../provider/local/guide_provider.dart';
import 'child/guide_menu_container.dart';

class GuideMenuScreen extends StatelessWidget {
  const GuideMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Guides", style: AppFont.headline6),
          SizedBox(height: 8.h),
          Text("These guide will help you to become a better player",
              style: AppFont.largeText),
          SizedBox(height: 24.h),
          const TitleLine(title: 'Beginner', height: 40, fontSize: 16),
          SizedBox(height: 12.h),
          _listMenuBeginnerGuide(),
          SizedBox(height: 24.h),
          const TitleLine(title: 'General', height: 40, fontSize: 16),
          SizedBox(height: 12.h),
          _listMenuGeneralGuide(),
        ],
      ),
    );
  }

  Consumer _listMenuBeginnerGuide() {
    return Consumer<GuideProvider>(
      builder: (context, notifier, _) => ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final data = notifier.beginnerMenuGuide[index];
            return GuideMenuContainer(guide: data);
          },
          separatorBuilder: (context, index) => SizedBox(height: 16.h),
          itemCount: notifier.beginnerMenuGuide.length),
    );
  }

  Consumer _listMenuGeneralGuide() {
    return Consumer<GuideProvider>(
      builder: (context, notifier, _) => ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final data = notifier.generalMenuGuide[index];
            return GuideMenuContainer(guide: data);
          },
          separatorBuilder: (context, index) => SizedBox(height: 16.h),
          itemCount: notifier.generalMenuGuide.length),
    );
  }
}

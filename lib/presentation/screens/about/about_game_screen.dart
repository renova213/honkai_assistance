import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/style/font_style.dart';
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
          const ListAboutContent(),
          SizedBox(height: 24.h),
          const OfficialLinks(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/common/style/app_color.dart';
import 'package:honkai_assistance/presentation/components/explanatory_container.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../provider/about_game_provider.dart';

class ListAboutContent extends StatelessWidget {
  const ListAboutContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AboutGameProvider>(
      builder: (context, notifier, _) => ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final data = notifier.aboutContents[index];

            return Column(
              children: [
                ExplanatoryContainer(
                    title: data["title"], description: data["description"]),
                SizedBox(height: 12.h),
                Container(
                  height: 200.h,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.blue, width: 3),
                  ),
                  child: Lottie.asset(data["assetImage"], fit: BoxFit.fill),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 16.h),
          itemCount: notifier.aboutContents.length),
    );
  }
}

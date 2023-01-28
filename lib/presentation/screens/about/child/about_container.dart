import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/common/style/app_color.dart';
import 'package:honkai_assistance/presentation/widgets/explanatory_container.dart';
import 'package:lottie/lottie.dart';

class AboutContainer extends StatelessWidget {
  final String title;
  final String description;
  final String assetImage;
  const AboutContainer(
      {super.key,
      required this.title,
      required this.description,
      required this.assetImage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExplanatoryContainer(title: title, description: description),
        SizedBox(height: 12.h),
        Container(
          height: 200.h,
          width: double.maxFinite,
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.blue, width: 3),
          ),
          child: Lottie.asset(assetImage, fit: BoxFit.fill),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/presentation/components/title_line.dart';

import '../../common/style/style.dart';

class ExplanatoryContainer extends StatelessWidget {
  final String title;
  final String description;
  const ExplanatoryContainer(
      {super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleLine(title: title, fontSize: 16, height: 40),
        SizedBox(height: 12.h),
        Text(description,
            style: AppFont.smallText, textAlign: TextAlign.justify)
      ],
    );
  }
}

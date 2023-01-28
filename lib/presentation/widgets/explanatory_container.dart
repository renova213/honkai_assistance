import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/presentation/widgets/title_line.dart';

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
        TitleLine(title: title),
        SizedBox(height: 12.h),
        Text(description,
            style: AppFont.smallText, textAlign: TextAlign.justify)
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/style/style.dart';

class TitleLine extends StatelessWidget {
  final double height;
  final String title;
  final double fontSize;
  const TitleLine(
      {super.key,
      required this.title,
      required this.height,
      required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          height: height.h,
          decoration: const BoxDecoration(
            color: Colors.transparent,
            border: Border(
              bottom: BorderSide(color: AppColor.blue, width: 3),
            ),
          ),
          child:
              Text(title, style: AppFont.subtitle.copyWith(fontSize: fontSize)),
        ),
        Expanded(
          child: Container(
            height: height.h,
            decoration: const BoxDecoration(
              color: Colors.transparent,
              border: Border(
                bottom: BorderSide(color: AppColor.lineColor, width: 1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

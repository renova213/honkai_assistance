import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/style/style.dart';

class TitleLine2 extends StatelessWidget {
  final String title;
  final String title2;
  const TitleLine2({super.key, required this.title, required this.title2});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          height: 40.h,
          decoration: const BoxDecoration(
            color: Colors.transparent,
            border: Border(
              bottom: BorderSide(color: AppColor.blue, width: 3),
            ),
          ),
          child: Text(title, style: AppFont.subtitle),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 16.w),
            height: 40.h,
            decoration: const BoxDecoration(
              color: Colors.transparent,
              border: Border(
                bottom: BorderSide(color: AppColor.lineColor, width: 1),
              ),
            ),
            child: Text(title2, style: AppFont.smallText),
          ),
        ),
      ],
    );
  }
}

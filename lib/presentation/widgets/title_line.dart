import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/style/style.dart';

class TitleLine extends StatelessWidget {
  final String title;
  const TitleLine({super.key, required this.title});

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
            height: 40.h,
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

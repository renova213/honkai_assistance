import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/style/style.dart';

class TitleBanner extends StatelessWidget {
  final String title;
  const TitleBanner({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 70.h,
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        border: Border.all(color: Colors.grey.shade800),
      ),
      child: Center(
        child: Text(title, style: AppFont.subtitle),
      ),
    );
  }
}

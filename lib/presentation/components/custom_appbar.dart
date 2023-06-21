import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/style/style.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: 60.h,
      width: double.maxFinite,
      child: Row(
        children: [
          const SizedBox(width: 16),
          Image.asset('assets/images/crystal.png', width: 40, height: 40),
          Text(
            "HonkaiAssistance",
            style: AppFont.headline6,
          ),
        ],
      ),
    );
  }
}

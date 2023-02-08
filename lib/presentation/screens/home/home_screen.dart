import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:honkai_assistance/presentation/components/title_line.dart';

import 'child/home_childs.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const RedeemCode(),
          SizedBox(height: 32.h),
          const NewsUpdate(),
          SizedBox(height: 32.h),
          const CurrentEvent(),
          SizedBox(height: 32.h),
          const TitleLine(title: "Current Banner", fontSize: 16, height: 40),
          SizedBox(height: 16.h),
          const CharacterBanner(),
          SizedBox(height: 32.h),
          const EquipmentBanner(),
          SizedBox(height: 32.h),
          const ElfBanner(),
        ],
      ),
    );
  }
}

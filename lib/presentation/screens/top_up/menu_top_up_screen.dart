import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/common/style/font_style.dart';
import 'package:honkai_assistance/presentation/screens/top_up/child/top_up_childs.dart';

class MenuTopUpScreen extends StatelessWidget {
  const MenuTopUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const AppBarTopUp(),
          _description(),
          SizedBox(height: 24.h),
          const UserIdTopUp(),
          SizedBox(height: 16.h),
          const CategoryTopUp(),
        ],
      ),
    );
  }

  Padding _description() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Honkai Impact 3", style: AppFont.headline5),
          SizedBox(height: 16.h),
          Text(
              "Untuk menemukan User ID Anda, buka aplikasi Honkai Impact 3, klik pada informasi level yang terletak di kiri atas layar, temukan User ID Anda disana. Silakan masukan User ID Anda disini.",
              style: AppFont.mediumText
                  .copyWith(color: Colors.white.withOpacity(0.8)),
              textAlign: TextAlign.justify),
        ],
      ),
    );
  }
}

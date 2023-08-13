import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/common/style/style.dart';

class CategoryTopUp extends StatelessWidget {
  const CategoryTopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        padding:
            const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black),
                  child: Center(child: Text("2", style: AppFont.subtitle)),
                ),
                SizedBox(width: 12.w),
                Text(
                  "Pilih Kategori & Item",
                  style: AppFont.subtitle.copyWith(color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            Text("Pilih Kategori",
                style: AppFont.mediumText.copyWith(color: Colors.black)),
          ],
        ),
      ),
    );
  }
}

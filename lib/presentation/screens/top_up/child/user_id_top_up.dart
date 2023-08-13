import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/common/style/style.dart';

class UserIdTopUp extends StatelessWidget {
  const UserIdTopUp({super.key});

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
                  child: Center(child: Text("1", style: AppFont.subtitle)),
                ),
                SizedBox(width: 12.w),
                Text(
                  "Masukkan User ID",
                  style: AppFont.subtitle.copyWith(color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            TextField(
              style: AppFont.largeText.copyWith(color: Colors.black),
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.only(left: 12.w, bottom: 10, top: 10),
                hintText: "Masukkan User Id",
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: Colors.black, width: 2)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: Colors.black, width: 1)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black)),
                hintStyle: AppFont.largeText
                    .copyWith(color: Colors.black.withOpacity(0.5)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

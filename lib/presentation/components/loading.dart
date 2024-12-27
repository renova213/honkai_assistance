import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeleton_text/skeleton_text.dart';

class Loading extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  const Loading(
      {super.key,
      required this.width,
      required this.height,
      required this.borderRadius});
  @override
  Widget build(BuildContext context) {
    return SkeletonAnimation(
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          color: Colors.grey.shade600,
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}

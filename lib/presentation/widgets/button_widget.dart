import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../common/style/style.dart';

class ButtonWidget extends StatelessWidget {
  final double height;
  final double width;
  final Text text;
  final Function onTap;
  const ButtonWidget(
      {super.key,
      required this.height,
      required this.width,
      required this.text,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Ink(
        height: height.h,
        width: width.w,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColor.borderColor,
          ),
          color: AppColor.containerColor,
        ),
        child: Center(child: text),
      ),
    );
  }
}

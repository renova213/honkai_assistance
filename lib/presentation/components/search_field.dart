import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/common/style/style.dart';

class SearchField extends StatelessWidget {
  final double width;
  final String hintText;
  final TextEditingController controller;
  final void Function(String value) onChanged;

  const SearchField(
      {super.key,
      required this.width,
      required this.hintText,
      required this.controller,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35.h,
      width: width.w,
      child: TextField(
        style: AppFont.smallText,
        onChanged: (value) => onChanged(value),
        controller: controller,
        decoration: InputDecoration(
          errorBorder: null,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.borderColor),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.borderColor),
          ),
          disabledBorder: null,
          focusedErrorBorder: null,
          contentPadding: EdgeInsets.all(8.r),
          hintText: hintText,
          hintStyle: AppFont.smallText.copyWith(color: const Color(0xffBDBDBD)),
          fillColor: AppColor.containerColor,
          filled: true,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.borderColor),
          ),
        ),
      ),
    );
  }
}

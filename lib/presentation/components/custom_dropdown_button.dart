import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/style/style.dart';

class CustomDropdownButton extends StatelessWidget {
  final double height;
  final double width;
  final String value;
  final List items;
  final void Function(String value) changeValue;

  const CustomDropdownButton(
      {super.key,
      required this.height,
      required this.width,
      required this.value,
      required this.changeValue,
      required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      width: width.w,
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          selectedItemHighlightColor: AppColor.blue,
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
          dropdownDecoration: const BoxDecoration(
            color: AppColor.containerColor,
          ),
          buttonDecoration: BoxDecoration(
            border: Border.all(
              color: AppColor.borderColor,
            ),
            color: AppColor.containerColor,
          ),
          focusColor: Colors.white,
          items: items
              .map(
                (item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: AppFont.smallText,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
              .toList(),
          value: value,
          onChanged: (value) {
            changeValue(value!);
          },
        ),
      ),
    );
  }
}

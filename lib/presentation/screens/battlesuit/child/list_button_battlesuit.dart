import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/common/style/style.dart';

import '../../../widgets/button_widget.dart';
import '../../../widgets/custom_dropdown_button.dart';

class ListButtonBattlesuit extends StatelessWidget {
  const ListButtonBattlesuit({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomDropdownButton(
                  changeValue: (value) => () {},
                  height: 35,
                  width: double.maxFinite,
                  value: "Sort By A-Z",
                  items: const ["Sort By A-Z", "Sort By Z-A"]),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: CustomDropdownButton(
                  changeValue: (value) => () {},
                  height: 35,
                  width: double.maxFinite,
                  value: "Sort By A-Z",
                  items: const ["Sort By A-Z", "Sort By Z-A"]),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            Expanded(
              child: CustomDropdownButton(
                  changeValue: (value) => () {},
                  height: 35,
                  width: double.maxFinite,
                  value: "Sort By A-Z",
                  items: const ["Sort By A-Z", "Sort By Z-A"]),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: ButtonWidget(
                  height: 35,
                  width: double.maxFinite,
                  text: Text("Reset", style: AppFont.smallText),
                  onTap: () {}),
            ),
          ],
        ),
      ],
    );
  }
}

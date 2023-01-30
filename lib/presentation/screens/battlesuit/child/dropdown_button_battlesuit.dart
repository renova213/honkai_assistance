import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/common/style/style.dart';
import 'package:provider/provider.dart';

import '../../../providers/character_provider.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/custom_dropdown_button.dart';

class DropdownButtonBattlesuit extends StatelessWidget {
  const DropdownButtonBattlesuit({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CharacterProvider>(
      builder: (context, notifier, _) => Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CustomDropdownButton(
                    changeValue: (value) {
                      notifier.changeSortValue(value);
                    },
                    height: 35,
                    width: double.maxFinite,
                    value: notifier.sortValue,
                    items: const ["Sort By A-Z", "Sort By Z-A"]),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: CustomDropdownButton(
                    changeValue: (value) {
                      notifier.changeRole(value);
                    },
                    height: 35,
                    width: double.maxFinite,
                    value: notifier.role,
                    items: const ["DPS", "Support"]),
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
      ),
    );
  }
}

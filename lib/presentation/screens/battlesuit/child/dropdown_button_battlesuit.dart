import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/common/style/style.dart';
import 'package:provider/provider.dart';

import '../../../provider/firestore/battlesuit_provider.dart';
import '../../../components/button_widget.dart';
import '../../../components/custom_dropdown_button.dart';

class DropdownButtonBattlesuit extends StatelessWidget {
  final TextEditingController searchController;
  const DropdownButtonBattlesuit({super.key, required this.searchController});

  @override
  Widget build(BuildContext context) {
    return Consumer<BattlesuitProvider>(
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
                    items: const ["Any Role", "DPS", "Support"]),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Expanded(
                child: CustomDropdownButton(
                    changeValue: (value) {
                      notifier.changeTypeATK(value);
                    },
                    height: 35,
                    width: double.maxFinite,
                    value: notifier.typeATK,
                    items: const [
                      "Any ATK",
                      "Physical",
                      "Ice",
                      "Fire",
                      "Lightning"
                    ]),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: ButtonWidget(
                    height: 35,
                    width: double.maxFinite,
                    text: Text("Reset", style: AppFont.smallText),
                    onTap: () {
                      notifier.resetButton(searchController);
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../components/custom_dropdown_button.dart';
import '../../../provider/battlesuit_provider.dart';

class DropdownButtonBattlesuit extends StatelessWidget {
  final TextEditingController controller;
  const DropdownButtonBattlesuit({super.key, required this.controller});

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
                    notifier.searchBattlesuit(
                        searchValue: controller.text,
                        roleValue: notifier.role,
                        typeValue: value);
                  },
                  height: 35,
                  width: double.maxFinite,
                  value: notifier.typeATK,
                  items: const [
                    "Any Type",
                    "Physical",
                    "Ice",
                    "Fire",
                    "Lightning"
                  ],
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: CustomDropdownButton(
                  changeValue: (value) {
                    notifier.searchBattlesuit(
                        searchValue: controller.text,
                        typeValue: notifier.typeATK,
                        roleValue: value);
                  },
                  height: 35,
                  width: double.maxFinite,
                  value: notifier.role,
                  items: const ["Any Role", "DPS", "Support"],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

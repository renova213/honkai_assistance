import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../provider/firestore/battlesuit_provider.dart';
import '../../../components/custom_dropdown_button.dart';

class DropdownButtonBattlesuit extends StatelessWidget {
  const DropdownButtonBattlesuit({super.key});

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
                  ],
                ),
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

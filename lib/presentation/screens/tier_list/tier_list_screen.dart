import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/presentation/components/changelog.dart';
import 'package:honkai_assistance/presentation/components/custom_dropdown_button.dart';
import 'package:honkai_assistance/presentation/components/help.dart';
import 'package:honkai_assistance/presentation/components/title_line.dart';
import 'package:honkai_assistance/presentation/screens/tier_list/child/tier_list_childs.dart';
import 'package:provider/provider.dart';

import '../../../common/style/style.dart';
import '../../provider/tier_list_provider.dart';

class TierListScreen extends StatefulWidget {
  const TierListScreen({super.key});

  @override
  State<TierListScreen> createState() => _TierListScreenState();
}

class _TierListScreenState extends State<TierListScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<TierListProvider>(context, listen: false).changeRole('DPS');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Tier List", style: AppFont.headline6),
          SizedBox(height: 8.h),
          Text("DPS and support tier list for SEA and global server",
              style: AppFont.largeText),
          SizedBox(height: 16.h),
          Text("Role", style: AppFont.subtitle),
          SizedBox(height: 12.h),
          Consumer<TierListProvider>(
            builder: (context, notifier, _) => CustomDropdownButton(
                height: 40,
                width: 150,
                value: notifier.role,
                changeValue: (value) {
                  notifier.changeRole(value);
                },
                items: const ['DPS', 'Support']),
          ),
          SizedBox(height: 24.h),
          const TitleLine(title: 'DPS', height: 40, fontSize: 16),
          Container(
            height: 50,
            width: double.maxFinite,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColor.lineColor),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Changelog(),
                Help(),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Consumer<TierListProvider>(
              builder: (context, notifier, _) => notifier.role == 'DPS'
                  ? const DPSTierList()
                  : const SupportTierList()),
          SizedBox(height: 80.h),
        ],
      ),
    );
  }
}

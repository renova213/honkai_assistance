import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/presentation/screens/tier_list/child/tier_list_childs.dart';
import 'package:provider/provider.dart';

import '../../../provider/tier_list_provider.dart';

class SupportTierList extends StatelessWidget {
  const SupportTierList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TierListProvider>(
      builder: (context, tierList, _) => Column(
        children: [
          TierListContainer(
              tierList: tierList.supportTierS,
              tier: 'S',
              color: const Color(0xFFF44336)),
          SizedBox(height: 12.h),
          TierListContainer(
              tierList: tierList.supportTierA,
              tier: 'A',
              color: const Color(0xFFFF9800)),
          SizedBox(height: 12.h),
          TierListContainer(
              tierList: tierList.supportTierB,
              tier: 'B',
              color: const Color(0xFF2B65EC)),
          SizedBox(height: 12.h),
          TierListContainer(
              tierList: tierList.supportTierOut,
              tier: 'OUT',
              color: const Color(0xFF82B1FF)),
        ],
      ),
    );
  }
}

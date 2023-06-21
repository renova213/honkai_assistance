import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/presentation/screens/tier_list/child/tier_list_childs.dart';
import 'package:provider/provider.dart';

import '../../../provider/tier_list_provider.dart';

class DPSTierList extends StatelessWidget {
  const DPSTierList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TierListProvider>(
      builder: (context, tierList, _) => Column(
        children: [
          TierListContainer(
              tierList: tierList.dpsTierEX,
              tier: 'EX',
              color: const Color(0xFFF44336)),
          SizedBox(height: 12.h),
          TierListContainer(
              tierList: tierList.dpsTierS,
              tier: 'S',
              color: const Color(0xFFFF5252)),
          SizedBox(height: 12.h),
          TierListContainer(
              tierList: tierList.dpsTierA,
              tier: 'A',
              color: const Color(0xFFFF9800)),
          SizedBox(height: 12.h),
          TierListContainer(
              tierList: tierList.dpsTierB,
              tier: 'B',
              color: const Color(0xFF2B65EC)),
          SizedBox(height: 12.h),
          TierListContainer(
              tierList: tierList.dpsTierOut,
              tier: 'OUT',
              color: const Color(0xFF82B1FF)),
        ],
      ),
    );
  }
}

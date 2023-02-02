import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/domain/entities/character_entity.dart';

import '../../../../common/style/style.dart';

class BattlesuitTeam extends StatelessWidget {
  final List<CharacterTeamEntity> battlesuitTeams;
  const BattlesuitTeam({super.key, required this.battlesuitTeams});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Team", style: AppFont.subtitle),
        SizedBox(height: 16.h),
        Container(
          decoration: BoxDecoration(
              color: AppColor.secondaryColor,
              borderRadius: BorderRadius.circular(10)),
          width: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.all(16).r,
            child: Column(
              children: const [],
            ),
          ),
        ),
      ],
    );
  }
}

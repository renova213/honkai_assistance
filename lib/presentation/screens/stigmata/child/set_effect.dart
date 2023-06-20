import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/domain/entities/stigmata_entity.dart';
import 'package:honkai_assistance/presentation/components/title_line.dart';

import '../../../../common/style/style.dart';

class SetEffect extends StatefulWidget {
  final bool onTap;
  final List<SetEffectEntity> setEffects;
  const SetEffect({super.key, required this.onTap, required this.setEffects});

  @override
  State<SetEffect> createState() => _WeaponSkillContainerState();
}

class _WeaponSkillContainerState extends State<SetEffect> {
  bool? onTap;
  @override
  void initState() {
    onTap = widget.onTap;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4).r,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColor.red, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                onTap = !onTap!;
              });
            },
            child: Row(
              children: [
                Icon(
                    onTap!
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_right,
                    color: AppColor.red),
                SizedBox(width: 8.w),
                Text('Stigmata Set Effects', style: AppFont.boldSmallText),
              ],
            ),
          ),
          onTap! ? listStigmataEffect() : const SizedBox(),
        ],
      ),
    );
  }

  Padding listStigmataEffect() {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 4, right: 4).r,
      child: Column(
        children: List.generate(
          widget.setEffects.length,
          (index) {
            final data = widget.setEffects[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleLine(title: data.setName, fontSize: 12, height: 35),
                SizedBox(height: 8.h),
                Text(data.description,
                    style: AppFont.smallText, textAlign: TextAlign.justify),
                SizedBox(height: 8.h)
              ],
            );
          },
        ),
      ),
    );
  }
}

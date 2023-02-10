import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/domain/entities/stigmata_entity.dart';
import 'package:honkai_assistance/presentation/components/title_line.dart';

import '../../../../common/style/style.dart';

class StigmataEffect extends StatefulWidget {
  final bool onTap;
  final List<StigmataEffectEntity> stigmataEffects;
  const StigmataEffect(
      {super.key, required this.onTap, required this.stigmataEffects});

  @override
  State<StigmataEffect> createState() => _WeaponSkillContainerState();
}

class _WeaponSkillContainerState extends State<StigmataEffect> {
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
                Text('Stigmata Effects', style: AppFont.boldSmallText),
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
          widget.stigmataEffects.length,
          (index) {
            final data = widget.stigmataEffects[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleLine(title: data.titleEffect, fontSize: 12, height: 35),
                SizedBox(height: 8.h),
                Text(data.descriptionEffect,
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

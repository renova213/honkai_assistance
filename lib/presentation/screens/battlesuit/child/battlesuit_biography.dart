import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/domain/entities/character_entity.dart';

import '../../../../common/style/style.dart';

class BattlesuitBiography extends StatelessWidget {
  final CharacterBiographyEntity battlesuitBiography;
  const BattlesuitBiography({super.key, required this.battlesuitBiography});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Biography", style: AppFont.subtitle),
        SizedBox(height: 16.h),
        Container(
          decoration: BoxDecoration(
              color: AppColor.secondaryColor,
              borderRadius: BorderRadius.circular(10)),
          width: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.all(16).r,
            child: Column(
              children: [
                _titleContainer('Battlesuit Status'),
                SizedBox(height: 16.h),
                _battlesuitStatus(),
                SizedBox(height: 16.h),
                _titleContainer('Battlesuit Info'),
                SizedBox(height: 16.h),
                _backgroundDetail(),
                SizedBox(height: 16.h),
                _titleContainer('Battlesuit Detail'),
                SizedBox(height: 16.h),
                _battlesuitDetail(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container _titleContainer(String title) {
    return Container(
      height: 30.h,
      width: double.maxFinite,
      decoration: BoxDecoration(
          border: Border.all(color: AppColor.borderColor, width: 2),
          borderRadius: BorderRadius.circular(10)),
      alignment: Alignment.center,
      child: Text(title,
          style: AppFont.smallText.copyWith(fontWeight: FontWeight.bold)),
    );
  }

  Column _battlesuitStatus() {
    return Column(
      children: [
        _battlesuitItem('Rank', battlesuitBiography.rank),
        SizedBox(height: 8.h),
        _battlesuitItem('Type Element', battlesuitBiography.typeElement),
        SizedBox(height: 8.h),
        _battlesuitItem('ATK Type', battlesuitBiography.typeATK),
      ],
    );
  }

  Text _backgroundDetail() {
    return Text(battlesuitBiography.backgroundDetail,
        style: AppFont.smallText, textAlign: TextAlign.justify);
  }

  Column _battlesuitDetail() {
    return Column(
      children: [
        _battlesuitItem('Date of Birth', battlesuitBiography.dateBirth),
        SizedBox(height: 8.h),
        _battlesuitItem('Gender', battlesuitBiography.gender),
        SizedBox(height: 8.h),
        _battlesuitItem('Organization', battlesuitBiography.organization),
        SizedBox(height: 8.h),
        _battlesuitItem('Height', battlesuitBiography.height),
        SizedBox(height: 8.h),
        _battlesuitItem('Weight', battlesuitBiography.weight),
        SizedBox(height: 8.h),
        _battlesuitItem('Birthplace', battlesuitBiography.birthplace),
      ],
    );
  }

  SizedBox _battlesuitItem(String text1, String text2) {
    return SizedBox(
      height: 30.h,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColor.containerColor),
              alignment: Alignment.center,
              child: Text(text1, style: AppFont.smallText),
            ),
          ),
          SizedBox(width: 8.w),
          Text(":", style: AppFont.smallText),
          SizedBox(width: 8.w),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: AppColor.containerColor),
              alignment: Alignment.center,
              child: Text(text2, style: AppFont.smallText),
            ),
          ),
        ],
      ),
    );
  }
}

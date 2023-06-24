import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/domain/entities/character_entity.dart';
import 'package:honkai_assistance/presentation/components/help.dart';

import '../../../../common/style/style.dart';
import '../../../components/loading.dart';

class BattlesuitSpeciality extends StatelessWidget {
  final List<CharacterSpecialityEntity> battlesuitSpecialities;
  const BattlesuitSpeciality({super.key, required this.battlesuitSpecialities});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Speciality", style: AppFont.subtitle),
        SizedBox(height: 16.h),
        Container(
          decoration: BoxDecoration(
              color: AppColor.secondaryColor,
              borderRadius: BorderRadius.circular(10)),
          height: 95.h,
          width: double.maxFinite,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 16, top: 8, bottom: 8, right: 16).r,
            child: Column(
              children: [
                Expanded(
                    child: _listBattlesuitSpecilities(battlesuitSpecialities)),
                SizedBox(height: 16.h),
                const Help(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Align _listBattlesuitSpecilities(
      List<CharacterSpecialityEntity> battlesuitSpecialities) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final data = battlesuitSpecialities[index];

            return Container(
              decoration: BoxDecoration(
                  color: AppColor.containerColor,
                  borderRadius: BorderRadius.circular(5)),
              height: 40.h,
              width: 105.w,
              padding: EdgeInsets.all(8.r),
              child: Row(
                children: [
                  SizedBox(
                    width: 24.w,
                    height: 24.h,
                    child: CachedNetworkImage(
                      imageUrl: data.urlImage,
                      errorWidget: (context, url, error) {
                        return const Center(
                          child: Icon(Icons.error, color: Colors.red),
                        );
                      },
                      placeholder: (context, url) {
                        return const Loading(
                            width: 24, height: 24, borderRadius: 0);
                      },
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(data.name, style: AppFont.smallText)),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(width: 8.w),
          itemCount: battlesuitSpecialities.length),
    );
  }
}

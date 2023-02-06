import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/presentation/screens/weapon/child/weapon_childs.dart';

import '../../../../common/style/style.dart';
import '../../../../domain/entities/weapon_entity.dart';
import '../../../components/loading.dart';
import '../../../components/rating_star.dart';

class WeaponContainer extends StatelessWidget {
  final WeaponEntity weapon;
  const WeaponContainer({super.key, required this.weapon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 24, bottom: 24),
      child: Material(
        color: Colors.transparent,
        child: IntrinsicHeight(
          child: Container(
            padding: const EdgeInsets.all(8).r,
            decoration: BoxDecoration(
                color: AppColor.containerColor,
                borderRadius: BorderRadius.circular(5).r),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      CachedNetworkImage(
                        imageUrl: weapon.urlImage,
                        errorWidget: (context, url, error) {
                          return const Center(
                            child: Icon(Icons.error, color: Colors.red),
                          );
                        },
                        placeholder: (context, url) {
                          return const Loading(
                              width: 80, height: 70, borderRadius: 0);
                        },
                        width: 80.w,
                        height: 70.h,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(width: 16.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            weapon.weaponName,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppFont.mediumText
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8.h),
                          RatingStar(
                              rating: double.parse(weapon.rank), size: 16.r),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  WeaponSkill(onTap: false, weaponSkills: weapon.skillWeapons),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

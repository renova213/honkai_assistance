import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/domain/entities/character_entity.dart';
import 'package:honkai_assistance/presentation/screens/battlesuit/child/battlesuit_childs.dart';
import 'package:honkai_assistance/presentation/components/rating_star.dart';
import 'package:provider/provider.dart';

import '../../../../common/style/style.dart';
import '../../../components/loading.dart';
import '../../../provider/battlesuit_provider.dart';

class BattlesuitWeapon extends StatefulWidget {
  final List<CharacterWeaponEntity> battlesuitWeapons;
  const BattlesuitWeapon({super.key, required this.battlesuitWeapons});

  @override
  State<BattlesuitWeapon> createState() => _BattlesuitWeaponState();
}

class _BattlesuitWeaponState extends State<BattlesuitWeapon> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<BattlesuitProvider>(context, listen: false)
          .filterWeapon(widget.battlesuitWeapons),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Weapon", style: AppFont.subtitle),
        SizedBox(height: 16.h),
        Container(
          decoration: BoxDecoration(
              color: AppColor.secondaryColor,
              borderRadius: BorderRadius.circular(10)),
          width: double.maxFinite,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 8)
                    .r,
            child: Consumer<BattlesuitProvider>(
              builder: (context, notifier, _) => Column(
                children: [
                  _titleContainer('Recommended'),
                  SizedBox(height: 16.h),
                  _listWeapon(notifier.recommendedWeapons),
                  SizedBox(height: 8.h),
                  _titleContainer('Other Option'),
                  SizedBox(height: 16.h),
                  _listWeapon(notifier.otherOptionWeapons),
                ],
              ),
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

  Column _listWeapon(List<CharacterWeaponEntity> battlesuitWeapons) {
    return Column(
      children: List.generate(
        battlesuitWeapons.length,
        (index) {
          final data = battlesuitWeapons[index];

          return Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8).r,
                decoration: BoxDecoration(
                    color: AppColor.containerColor,
                    borderRadius: BorderRadius.circular(5).r),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CachedNetworkImage(
                          imageUrl: data.urlImage,
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
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: AppFont.mediumText
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8.h),
                              RatingStar(
                                  rating: double.parse(data.star), size: 16.r),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    WeaponSkillContainer(
                        onTap: false, weaponSkills: data.weaponSkill!),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
            ],
          );
        },
      ),
    );
  }
}

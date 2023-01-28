import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/presentation/blocs/equipment_banner/equipment_banner_bloc.dart';
import 'package:honkai_assistance/presentation/widgets/title_banner.dart';

import '../../../../common/style/style.dart';
import '../../../widgets/loading.dart';

class EquipmentBanner extends StatelessWidget {
  const EquipmentBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const TitleBanner(title: "Equipment Banner"),
        _listEquipmentBanner(),
      ],
    );
  }

  Widget _listEquipmentBanner() {
    return BlocBuilder<EquipmentBannerBloc, EquipmentBannerState>(
      builder: (context, state) {
        if (state is LoadedEquipmentBannerState) {
          return Column(
            children: List.generate(
              state.equipmentBanners.length,
              (index) {
                final data = state.equipmentBanners[index];
                return Container(
                  width: double.maxFinite,
                  height: 200.h,
                  decoration: BoxDecoration(
                    color: index.isEven
                        ? Colors.transparent
                        : Colors.grey.shade800,
                    border: Border.all(color: Colors.grey.shade800, width: 2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 85.w,
                              height: 85.h,
                              child: CachedNetworkImage(
                                imageUrl: data.urlWeaponImage,
                                errorWidget: (context, url, error) {
                                  return const Center(
                                    child: Icon(Icons.error, color: Colors.red),
                                  );
                                },
                                placeholder: (context, url) {
                                  return const Loading(
                                      width: 85, height: 85, borderRadius: 0);
                                },
                                fit: BoxFit.fill,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  data.weaponName,
                                  style: AppFont.subtitle,
                                ),
                                const Text(""),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 85.w,
                              height: 85.h,
                              child: CachedNetworkImage(
                                imageUrl: data.urlStigmataImage,
                                errorWidget: (context, url, error) {
                                  return const Center(
                                    child: Icon(Icons.error, color: Colors.red),
                                  );
                                },
                                placeholder: (context, url) {
                                  return const Loading(
                                      width: 85, height: 85, borderRadius: 0);
                                },
                                fit: BoxFit.fill,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  alignment: Alignment.centerRight,
                                  width: 180.w,
                                  child: Text(
                                    data.stigmataName,
                                    style: AppFont.subtitle,
                                  ),
                                ),
                                SizedBox(height: 32.h),
                                Text(
                                  "Ends on ${data.endDate}",
                                  style: AppFont.smallText,
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
        return _loading();
      },
    );
  }

  Widget _loading() {
    return Container(
      width: double.maxFinite,
      height: 200.h,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Colors.grey.shade800, width: 2),
      ),
      child: Padding(
          padding: EdgeInsets.all(8.r),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Loading(width: 85, height: 85, borderRadius: 0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Loading(width: 150, height: 15, borderRadius: 0),
                      SizedBox(height: 24.h),
                      const Loading(width: 150, height: 15, borderRadius: 0),
                    ],
                  )
                ],
              ),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Loading(width: 85, height: 85, borderRadius: 0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Loading(width: 150, height: 15, borderRadius: 0),
                      SizedBox(height: 24.h),
                      const Loading(width: 150, height: 15, borderRadius: 0),
                    ],
                  )
                ],
              ),
            ],
          )),
    );
  }
}

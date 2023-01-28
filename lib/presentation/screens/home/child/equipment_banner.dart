import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/presentation/blocs/equipment_banner/equipment_banner_bloc.dart';
import 'package:honkai_assistance/presentation/widgets/title_line.dart';

import '../../../../common/style/style.dart';
import '../../../widgets/loading.dart';

class EquipmentBanner extends StatelessWidget {
  const EquipmentBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const TitleLine(title: "Equipment Banner"),
        _listBannerCharacters(),
      ],
    );
  }

  Widget _listBannerCharacters() {
    return BlocBuilder<EquipmentBannerBloc, EquipmentBannerState>(
      builder: (context, state) {
        if (state is LoadedEquipmentBannerState) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.equipmentBanners.length,
            itemBuilder: (context, index) {
              final data = state.equipmentBanners[index];
              return Container(
                width: double.maxFinite,
                height: 200.h,
                decoration: BoxDecoration(
                  color:
                      index.isEven ? Colors.transparent : Colors.grey.shade800,
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
                      const SizedBox(height: 8),
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
          );
        }
        return Text("Failed get weapon and stigmata data from server",
            style: AppFont.subtitle);
      },
    );
  }
}

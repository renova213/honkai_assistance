import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/domain/entities/stigmata_entity.dart';
import 'package:honkai_assistance/presentation/screens/stigmata/child/stigmata_childs.dart';

import '../../../../common/style/style.dart';
import '../../../components/loading.dart';
import '../../../components/rating_star.dart';

class ListStigmata extends StatelessWidget {
  final List<StigmataItemEntity> stigmatas;
  const ListStigmata({super.key, required this.stigmatas});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final data = stigmatas[index];
          return Container(
            padding: const EdgeInsets.all(8).r,
            decoration: BoxDecoration(
                color: AppColor.containerColor,
                borderRadius: BorderRadius.circular(5).r),
            child: Column(
              children: [
                Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl: data.stigmataImage!,
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
                          data.stigmataPieceName!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppFont.mediumText
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8.h),
                        RatingStar(
                            rating: double.parse(data.star!), size: 16.r),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                StigmataEffect(
                    onTap: false, stigmataEffects: data.stigmataEffects!),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 16.h),
        itemCount: stigmatas.length);
  }
}

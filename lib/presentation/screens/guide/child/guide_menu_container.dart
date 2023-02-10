import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/common/style/style.dart';
import 'package:honkai_assistance/domain/entities/guide_entity.dart';
import 'package:honkai_assistance/presentation/components/loading.dart';

import '../../../../common/util/utils.dart';
import '../detail_guide_screen.dart';

class GuideMenuContainer extends StatelessWidget {
  final GuideEntity guide;
  const GuideMenuContainer({super.key, required this.guide});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            NavigatorFadeHelper(
              child: DetailGuideScreen(guide: guide),
            ),
          );
        },
        child: Ink(
          decoration: BoxDecoration(
            color: AppColor.containerColor,
            border: Border.all(color: AppColor.borderColor),
            borderRadius: BorderRadius.circular(5),
          ),
          height: 55.h,
          width: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.only(right: 8).r,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 53.h,
                  width: 53,
                  child: CachedNetworkImage(
                    imageUrl: guide.urlImage,
                    errorWidget: (context, url, error) {
                      return const Center(
                        child: Icon(Icons.error, color: Colors.red),
                      );
                    },
                    placeholder: (context, url) {
                      return const Loading(
                          width: 55, height: 55, borderRadius: 0);
                    },
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(guide.titleGuide, style: AppFont.subtitle),
                      const Icon(Icons.keyboard_double_arrow_right,
                          color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

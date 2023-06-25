import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/domain/entities/outfit_entity.dart';
import 'package:provider/provider.dart';

import '../../../../common/style/style.dart';
import '../../../../common/util/utils.dart';
import '../../../components/grid_loading.dart';
import '../../../components/loading.dart';
import '../../../provider/outfit_provider.dart';

class GridOutfit extends StatelessWidget {
  const GridOutfit({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OutfitProvider>(
      builder: (context, notifier, _) {
        if (notifier.appState == AppState.loaded) {
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: notifier.searchResults.length,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 2 / 2.8,
                mainAxisSpacing: 12,
                crossAxisSpacing: 16,
                crossAxisCount: 3),
            itemBuilder: (context, index) {
              final data = notifier.searchResults[index];

              notifier.changeBottomColor(data.grade);

              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        _showDialog(context: context, outfit: data);
                      },
                      child: Ink(
                        width: 95.w,
                        height: 95.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  CachedNetworkImageProvider(data.outfitIcon),
                              fit: BoxFit.fill),
                          border: Border(
                            bottom: BorderSide(
                                width: 3, color: notifier.bottomColor),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(data.outfitName,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppFont.smallText,
                        textAlign: TextAlign.center)
                  ],
                ),
              );
            },
          );
        }

        return const GridLoading();
      },
    );
  }

  void _showDialog(
      {required BuildContext context, required OutfitEntity outfit}) {
    showDialog(
      context: context,
      builder: (context) => Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Container(
            width: double.maxFinite,
            height: 400.h,
            decoration: BoxDecoration(
                color: AppColor.secondaryColor,
                borderRadius: BorderRadius.circular(5)),
            child: Column(
              children: [
                Expanded(
                  child: CachedNetworkImage(
                      imageUrl: outfit.outfitImage,
                      errorWidget: (context, url, error) {
                        return const Center(
                          child: Icon(Icons.error, color: AppColor.red),
                        );
                      },
                      placeholder: (context, url) {
                        return const Loading(
                            width: double.maxFinite,
                            height: double.maxFinite,
                            borderRadius: 0);
                      },
                      fit: BoxFit.fill),
                ),
                Container(
                  height: 40.h,
                  width: double.maxFinite,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Color(0xff616161),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5)),
                  ),
                  child: Text(outfit.outfitName, style: AppFont.subtitle),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

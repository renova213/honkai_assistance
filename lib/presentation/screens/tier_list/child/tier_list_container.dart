import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../common/style/style.dart';
import '../../../../domain/entities/tier_list_entity.dart';
import '../../../provider/firestore/tier_list_provider.dart';

class TierListContainer extends StatelessWidget {
  final Color color;
  final String tier;
  final List<TierListEntity> tierList;
  const TierListContainer(
      {super.key,
      required this.tierList,
      required this.tier,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Row(
        children: [
          Container(
            width: 60.w,
            alignment: Alignment.center,
            child: Text(
              tier,
              style: AppFont.largeText.copyWith(color: Colors.black),
            ),
          ),
          Expanded(
            child: Container(
              color: AppColor.secondaryColor,
              child: Padding(
                padding: EdgeInsets.all(8.r),
                child: Consumer<TierListProvider>(
                  builder: (context, notifier, _) => GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: tierList.length,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            crossAxisCount: 4),
                    itemBuilder: (context, index) {
                      final data = tierList[index];
                      notifier.filterTypeATKImage(data.element);
                      return Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    color: notifier.bottomBorder, width: 3),
                              ),
                            ),
                            child: CachedNetworkImage(
                                imageUrl: data.image,
                                errorWidget: (context, url, error) {
                                  return const Center(
                                    child: Icon(Icons.error, color: Colors.red),
                                  );
                                },
                                placeholder: (context, url) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                                fit: BoxFit.fill),
                          ),
                          CachedNetworkImage(
                              imageUrl: notifier.typaATKImage,
                              errorWidget: (context, url, error) {
                                return const Center(
                                  child: Icon(Icons.error, color: Colors.red),
                                );
                              },
                              placeholder: (context, url) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                              height: 20,
                              width: 20),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/style/style.dart';

class TierListContainer extends StatelessWidget {
  const TierListContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Row(
        children: [
          Container(
            width: 60.w,
            alignment: Alignment.center,
            child: Text(
              'EX',
              style: AppFont.largeText.copyWith(color: Colors.black),
            ),
          ),
          Expanded(
            child: Container(
              color: AppColor.secondaryColor,
              child: Padding(
                padding: EdgeInsets.all(8.r),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.blue, width: 3),
                            ),
                          ),
                          child: CachedNetworkImage(
                              imageUrl:
                                  'https://i.ibb.co/ZYCwfw9/hof-chibi-removebg-preview.png',
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
                            imageUrl: 'https://i.postimg.cc/qhzGyvWB/ice.png',
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
        ],
      ),
    );
  }
}

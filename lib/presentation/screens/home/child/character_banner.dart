import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/presentation/components/title_banner.dart';
import 'package:provider/provider.dart';

import '../../../../common/style/style.dart';
import '../../../../common/util/enum_state.dart';
import '../../../components/loading.dart';
import '../../../provider/character_banner_provider.dart';

class CharacterBanner extends StatelessWidget {
  const CharacterBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleBanner(title: "Character Banner"),
        _listBannerCharacters(),
      ],
    );
  }

  Widget _listBannerCharacters() {
    return Consumer<CharacterBannerProvider>(
      builder: (context, notifier, _) {
        if (notifier.appstate == AppState.loaded) {
          return Column(
            children: List.generate(
              notifier.characterBanners.length,
              (index) {
                final data = notifier.characterBanners[index];

                return Container(
                  width: double.maxFinite,
                  height: 100.h,
                  decoration: BoxDecoration(
                    color: index.isEven
                        ? Colors.transparent
                        : Colors.grey.shade800,
                    border: Border.all(color: Colors.grey.shade800, width: 2),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 85.w,
                          height: 85.h,
                          child: CachedNetworkImage(
                            imageUrl: data.urlImage,
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              alignment: Alignment.centerRight,
                              width: 180.w,
                              child: Text(data.title, style: AppFont.subtitle),
                            ),
                            Text("Ends on ${data.endDate}",
                                style: AppFont.smallText),
                          ],
                        )
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
      height: 100.h,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Colors.grey.shade800, width: 2),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Loading(width: 85, height: 85, borderRadius: 0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Loading(width: 150, height: 15, borderRadius: 0),
                Loading(width: 150, height: 15, borderRadius: 0),
              ],
            )
          ],
        ),
      ),
    );
  }
}

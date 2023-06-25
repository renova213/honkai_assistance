import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../common/style/style.dart';
import '../../../../common/util/utils.dart';
import '../../../components/grid_loading.dart';
import '../../../provider/battlesuit_provider.dart';
import '../detail_battlesuit_scree.dart';

class GridBattlesuit extends StatelessWidget {
  const GridBattlesuit({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BattlesuitProvider>(
      builder: (context, notifier, _) {
        if (notifier.appState == AppState.loaded) {
          return notifier.searchResults.isEmpty
              ? _emptyListError()
              : GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: notifier.searchResults.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 2 / 3,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 16,
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    final data = notifier.searchResults[index];
                    notifier.changeBottomColor(data.characterTypeATK);
                    return Column(
                      children: [
                        Expanded(
                          flex: 10,
                          child: InkWell(
                            onTap: () async {
                              Navigator.of(context).push(
                                NavigatorFadeHelper(
                                    child: DetailBattlesuitScreen(
                                        character: data)),
                              );
                            },
                            child: Ink(
                              width: 95.w,
                              height: 95.h,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                        data.urlImageAvatar),
                                    fit: BoxFit.fill),
                                border: Border(
                                  bottom: BorderSide(
                                      width: 3, color: notifier.bottomColor),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Expanded(
                          flex: 4,
                          child: Text(data.characterName,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: AppFont.smallText,
                              textAlign: TextAlign.center),
                        )
                      ],
                    );
                  },
                );
        }

        return const GridLoading();
      },
    );
  }

  Column _emptyListError() {
    return Column(
      children: [
        Image.asset("assets/images/kiana.png", width: 100.w, height: 100.w),
        SizedBox(height: 16.h),
        Text("No battlesuits found. Try changing your filter.",
            style: AppFont.subtitle, textAlign: TextAlign.center),
      ],
    );
  }
}

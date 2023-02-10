import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../common/style/style.dart';
import '../../../../common/util/utils.dart';
import '../../../provider/firestore/battlesuit_provider.dart';
import '../../../components/grid_loading.dart';
import '../detail_battlesuit_scree.dart';

class GridBattlesuit extends StatelessWidget {
  const GridBattlesuit({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BattlesuitProvider>(
      builder: (context, notifier, _) {
        if (notifier.appState == AppState.loaded) {
          return GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: notifier.battlesuits.length,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 2 / 2.8,
                mainAxisSpacing: 12,
                crossAxisSpacing: 16,
                crossAxisCount: 3),
            itemBuilder: (context, index) {
              final data = notifier.battlesuits[index];
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Consumer<BattlesuitProvider>(
                      builder: (context, notifier, _) {
                        notifier.changeBottomColor(data.characterTypeATK);
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              NavigatorFadeHelper(
                                  child:
                                      DetailBattlesuitScreen(character: data)),
                            );
                          },
                          child: Ink(
                            width: 95.w,
                            height: 95.h,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                      data.urlImageCharacter),
                                  fit: BoxFit.fill),
                              border: Border(
                                bottom: BorderSide(
                                    width: 3, color: notifier.bottomColor),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 8.h),
                    Text(data.characterName,
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
}

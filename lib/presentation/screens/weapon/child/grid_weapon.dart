import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../common/style/style.dart';
import '../../../../common/util/utils.dart';
import '../../../components/grid_loading.dart';
import '../../../provider/weapon_provider.dart';
import 'weapon_container.dart';

class GridWeapon extends StatelessWidget {
  const GridWeapon({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WeaponProvider>(
      builder: (context, notifier, _) {
        if (notifier.appState == AppState.loaded) {
          return notifier.searchResults.isEmpty
              ? _emptyListError()
              : GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: notifier.searchResults.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 2 / 2.8,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 16,
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    final weapon = notifier.searchResults[index];

                    notifier.changeBottomColor(weapon.rank);

                    return SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              _generalDialog(
                                  context: context,
                                  screen: WeaponContainer(weapon: weapon));
                            },
                            child: Ink(
                              width: 95.w,
                              height: 95.h,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                        weapon.urlImage),
                                    fit: BoxFit.fill),
                                border: Border(
                                  bottom: BorderSide(
                                      width: 3, color: notifier.bottomColor),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(weapon.weaponName,
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

  void _generalDialog({required BuildContext context, required Widget screen}) {
    showGeneralDialog(
      barrierLabel: "showGeneralDialog",
      barrierDismissible: false,
      transitionDuration: const Duration(milliseconds: 200),
      context: context,
      pageBuilder: (context, _, __) {
        return Align(
          alignment: Alignment.center,
          child: screen,
        );
      },
      transitionBuilder: (_, animation1, __, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, 1),
            end: const Offset(0, 0),
          ).animate(animation1),
          child: child,
        );
      },
    );
  }

  Column _emptyListError() {
    return Column(
      children: [
        Image.asset("assets/images/kiana.png", width: 100.w, height: 100.w),
        SizedBox(height: 16.h),
        Text("No weapons found. Try changing your filter.",
            style: AppFont.subtitle, textAlign: TextAlign.center),
      ],
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/presentation/screens/elf/detail_elf_screen.dart';
import 'package:provider/provider.dart';

import '../../../../common/style/style.dart';
import '../../../../common/util/utils.dart';
import '../../../components/grid_loading.dart';
import '../../../provider/battlesuit_provider.dart';
import '../../../provider/elf_provider.dart';

class GridElf extends StatelessWidget {
  const GridElf({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ElfProvider>(
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
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Consumer<BattlesuitProvider>(
                      builder: (context, notifier, _) {
                        notifier.changeBottomColor(data.typeATK);
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              NavigatorFadeHelper(
                                child: DetailElfScreen(elf: data),
                              ),
                            );
                          },
                          child: Ink(
                            width: 95.w,
                            height: 95.h,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      CachedNetworkImageProvider(data.urlImage),
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
                    Text(data.elfName,
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

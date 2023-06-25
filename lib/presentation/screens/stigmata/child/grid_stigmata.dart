import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/presentation/screens/stigmata/detail_stigmata_screen.dart';
import 'package:provider/provider.dart';

import '../../../../common/style/style.dart';
import '../../../../common/util/utils.dart';
import '../../../components/grid_loading.dart';
import '../../../provider/stigmata_provider.dart';

class GridStigmata extends StatelessWidget {
  const GridStigmata({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<StigmataProvider>(
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

              notifier.changeBottomColor(data.stigmataItems!.isEmpty
                  ? '1.0'
                  : data.stigmataItems!.first.star!);
              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          NavigatorFadeHelper(
                            child: DetailStigmataScreen(stigmata: data),
                          ),
                        );
                      },
                      child: Ink(
                        width: 95.w,
                        height: 95.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                  data.stigmataImage),
                              fit: BoxFit.fill),
                          border: Border(
                            bottom: BorderSide(
                                width: 3, color: notifier.bottomColor),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(data.stigmataName,
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

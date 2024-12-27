import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/common/util/navigator_fade_helper.dart';
import 'package:honkai_assistance/presentation/components/loading.dart';
import 'package:honkai_assistance/presentation/provider/battlesuit_provider.dart';
import 'package:honkai_assistance/presentation/screens/battlesuit/detail_battlesuit_scree.dart';
import 'package:provider/provider.dart';

import '../../../../common/style/style.dart';
import '../../../../common/util/enum_state.dart';
import '../../../../domain/entities/tier_list_entity.dart';
import '../../../provider/tier_list_provider.dart';

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
                child: Consumer<BattlesuitProvider>(
                  builder: (context, battlesuit, _) =>
                      Consumer<TierListProvider>(
                    builder: (context, notifier, _) => notifier.appstate ==
                            AppState.loaded
                        ? GridView.builder(
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
                                  Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () async {
                                        await battlesuit
                                            .searchBattlesuit(
                                                searchValue: data.valkyrieName,
                                                typeValue: "Any Type",
                                                roleValue: "Any Role")
                                            .then(
                                          (_) {
                                            if (context.mounted) {
                                              battlesuit.searchResults.isEmpty
                                                  ? ScaffoldMessenger.of(
                                                          context)
                                                      .showSnackBar(
                                                      const SnackBar(
                                                        duration: Duration(
                                                            seconds: 1),
                                                        content: Text(
                                                            "Sorry, this battlesuit info hasn't been updated yet"),
                                                      ),
                                                    )
                                                  : Navigator.of(context).push(
                                                      NavigatorFadeHelper(
                                                        child: DetailBattlesuitScreen(
                                                            character: battlesuit
                                                                .searchResults
                                                                .first),
                                                      ),
                                                    );
                                            }
                                          },
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                                color: notifier.bottomBorder,
                                                width: 3),
                                          ),
                                        ),
                                        child: CachedNetworkImage(
                                            imageUrl: data.image,
                                            errorWidget: (context, url, error) {
                                              return const Center(
                                                child: Icon(Icons.error,
                                                    color: Colors.red),
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
                                    ),
                                  ),
                                  CachedNetworkImage(
                                      imageUrl: notifier.typaATKImage,
                                      errorWidget: (context, url, error) {
                                        return const Center(
                                          child: Icon(Icons.error,
                                              color: Colors.red),
                                        );
                                      },
                                      placeholder: (context, url) {
                                        return const Loading(
                                            width: 20,
                                            height: 20,
                                            borderRadius: 0);
                                      },
                                      height: 20,
                                      width: 20),
                                ],
                              );
                            },
                          )
                        : _loading(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  GridView _loading() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: tierList.length,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 8, crossAxisSpacing: 8, crossAxisCount: 4),
      itemBuilder: (context, index) => const Loading(
          width: double.maxFinite, height: double.maxFinite, borderRadius: 0),
    );
  }
}

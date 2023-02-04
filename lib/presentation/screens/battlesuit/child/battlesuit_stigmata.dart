import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/domain/entities/character_entity.dart';
import 'package:honkai_assistance/presentation/provider/button/battlesuit_button_provider.dart';
import 'package:honkai_assistance/presentation/screens/battlesuit/child/battlesuit_childs.dart';
import 'package:provider/provider.dart';

import '../../../../common/style/style.dart';
import '../../../components/loading.dart';
import '../../../components/rating_star.dart';
import '../../../provider/firestore/battlesuit_provider.dart';

class BattlesuitStigmata extends StatefulWidget {
  final List<CharacterStigmataEntity> battlesuitStigmatas;
  const BattlesuitStigmata({super.key, required this.battlesuitStigmatas});

  @override
  State<BattlesuitStigmata> createState() => _BattlesuitStigmataState();
}

class _BattlesuitStigmataState extends State<BattlesuitStigmata> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<BattlesuitProvider>(context, listen: false)
          .filterStigmata(widget.battlesuitStigmatas),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Stigmata", style: AppFont.subtitle),
        SizedBox(height: 16.h),
        _changePieceStigmata(),
        SizedBox(height: 8.h),
        Container(
          decoration: BoxDecoration(
              color: AppColor.secondaryColor,
              borderRadius: BorderRadius.circular(10)),
          width: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.all(16).r,
            child: Consumer<BattlesuitProvider>(
              builder: (context, battlesuit, _) =>
                  Consumer<BattlesuitButtonProvider>(
                builder: (context, battlesuitButton, _) => Column(
                  children: [
                    _titleContainer('Recommended'),
                    SizedBox(height: 16.h),
                    _listStigmata(battlesuitButton.index == 0
                        ? battlesuit.recommendedTStigmatas
                        : battlesuitButton.index == 1
                            ? battlesuit.recommendedMStigmatas
                            : battlesuit.recommendedBStigmatas),
                    SizedBox(height: 16.h),
                    _titleContainer('Other Option'),
                    SizedBox(height: 16.h),
                    _listStigmata(battlesuitButton.index == 0
                        ? battlesuit.otherOptionTStigmatas
                        : battlesuitButton.index == 1
                            ? battlesuit.otherOptionMStigmatas
                            : battlesuit.otherOptionBStigmatas),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Consumer _changePieceStigmata() {
    return Consumer<BattlesuitButtonProvider>(
      builder: (context, battlesuitButton, _) => Row(
        children: [
          _containerStigmataPiece(
              changedIndex: (index) => battlesuitButton.changeIndex(index),
              index: battlesuitButton.index,
              containerIndex: 0,
              text: 'T'),
          _containerStigmataPiece(
              changedIndex: (index) => battlesuitButton.changeIndex(index),
              index: battlesuitButton.index,
              containerIndex: 1,
              text: 'M'),
          _containerStigmataPiece(
              changedIndex: (index) => battlesuitButton.changeIndex(index),
              index: battlesuitButton.index,
              containerIndex: 2,
              text: 'B'),
        ],
      ),
    );
  }

  Material _containerStigmataPiece(
      {required void Function(int index) changedIndex,
      required int index,
      required int containerIndex,
      required String text}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => changedIndex(containerIndex),
        child: Container(
          width: 50.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: index == containerIndex
                ? AppColor.containerColor
                : AppColor.secondaryColor,
            border: Border(
              bottom: BorderSide(
                  color: index == containerIndex
                      ? AppColor.red
                      : AppColor.lineColor,
                  width: 3),
            ),
          ),
          alignment: Alignment.center,
          child: Text(text,
              style: index == containerIndex
                  ? AppFont.subtitle
                  : AppFont.largeText),
        ),
      ),
    );
  }

  Container _titleContainer(String title) {
    return Container(
      height: 30.h,
      width: double.maxFinite,
      decoration: BoxDecoration(
          border: Border.all(color: AppColor.borderColor, width: 2),
          borderRadius: BorderRadius.circular(10)),
      alignment: Alignment.center,
      child: Text(title,
          style: AppFont.smallText.copyWith(fontWeight: FontWeight.bold)),
    );
  }

  Column _listStigmata(List<CharacterStigmataEntity> battlesuitStigmatas) {
    return Column(
      children: List.generate(
        battlesuitStigmatas.length,
        (index) {
          final data = battlesuitStigmatas[index];

          return Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8).r,
                decoration: BoxDecoration(
                    color: AppColor.containerColor,
                    borderRadius: BorderRadius.circular(5).r),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CachedNetworkImage(
                          imageUrl: data.urlImage,
                          errorWidget: (context, url, error) {
                            return const Center(
                              child: Icon(Icons.error, color: Colors.red),
                            );
                          },
                          placeholder: (context, url) {
                            return const Loading(
                                width: 80, height: 70, borderRadius: 0);
                          },
                          width: 80.w,
                          height: 70.h,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(width: 16.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: AppFont.mediumText
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8.h),
                            RatingStar(
                                rating: double.parse(data.star), size: 16.r),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    StigmataEffectContainer(
                        onTap: false, stigmataEffects: data.stigmataEffect!),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
            ],
          );
        },
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/domain/entities/character_entity.dart';

import '../../../../common/style/style.dart';
import '../../../components/loading.dart';

class BattlesuitTeam extends StatelessWidget {
  final List<CharacterTeamEntity> battlesuitTeams;
  const BattlesuitTeam({super.key, required this.battlesuitTeams});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Team", style: AppFont.subtitle),
        SizedBox(height: 16.h),
        Container(
          decoration: BoxDecoration(
              color: AppColor.secondaryColor,
              borderRadius: BorderRadius.circular(10)),
          width: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.all(16).r,
            child: _listTeam(),
          ),
        ),
      ],
    );
  }

  Column _listTeam() {
    return Column(
      children: List.generate(
        battlesuitTeams.length,
        (index) {
          final teams = battlesuitTeams[index];
          return Container(
            padding: const EdgeInsets.only(bottom: 8).r,
            decoration: const BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: AppColor.containerColor)),
            ),
            child: Row(
              children: [
                Text("#${index + 1}", style: AppFont.boldMediumText),
                SizedBox(width: 16.w),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    teams.teamList.length,
                    (index) {
                      final data = teams.teamList[index];

                      return Row(
                        children: [
                          Column(
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
                                      width: 70, height: 60, borderRadius: 0);
                                },
                                width: 70.w,
                                height: 60.h,
                                fit: BoxFit.fill,
                              ),
                              SizedBox(height: 8.h),
                              SizedBox(
                                width: 70.w,
                                child: Text(data.name,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                    style: AppFont.mediumText),
                              ),
                            ],
                          ),
                          SizedBox(width: 8.w),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

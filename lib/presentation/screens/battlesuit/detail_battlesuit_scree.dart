import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/domain/entities/character_entity.dart';

import '../../../common/style/style.dart';
import '../../components/loading.dart';
import 'child/battlesuit_childs.dart';

class DetailBattlesuitScreen extends StatelessWidget {
  final CharacterEntity character;
  const DetailBattlesuitScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: [
            SliverAppBar(
              leading: InkWell(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back, color: Colors.white),
              ),
              expandedHeight: 150.h,
              pinned: true,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.zero,
                expandedTitleScale: 1.2,
                centerTitle: true,
                title: SizedBox(
                  height: 120.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CachedNetworkImage(
                          imageUrl: character.urlImageATK,
                          errorWidget: (context, url, error) {
                            return const Center(
                              child: Icon(Icons.error, color: Colors.red),
                            );
                          },
                          placeholder: (context, url) {
                            return const Loading(
                                width: 30, height: 30, borderRadius: 0);
                          },
                          fit: BoxFit.fill,
                          width: 30,
                          height: 30),
                      SizedBox(width: 8.w),
                      Text(character.characterName, style: AppFont.subtitle),
                    ],
                  ),
                ),
                background: CachedNetworkImage(
                  imageUrl: character.urlImageCharacter,
                  errorWidget: (context, url, error) {
                    return const Center(
                      child: Icon(Icons.error, color: Colors.red),
                    );
                  },
                  placeholder: (context, url) {
                    return const Center(
                      child: Loading(
                          width: 130,
                          height: double.maxFinite,
                          borderRadius: 0),
                    );
                  },
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 1,
                (context, index) => Padding(
                  padding: EdgeInsets.all(20.r),
                  child: Column(
                    children: [
                      BattlesuitSpeciality(
                          battlesuitSpecialities:
                              character.characterSpeciality!),
                      SizedBox(height: 24.h),
                      BattlesuitBiography(
                          battlesuitBiography: character.characterBiography!),
                      SizedBox(height: 24.h),
                      BattlesuitWeapon(
                          battlesuitWeapons: character.characterWeapon!),
                      SizedBox(height: 24.h),
                      BattlesuitStigmata(
                          battlesuitStigmatas: character.characterStigmata!),
                      SizedBox(height: 24.h),
                      BattlesuitTeam(battlesuitTeams: character.characterTeam!),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

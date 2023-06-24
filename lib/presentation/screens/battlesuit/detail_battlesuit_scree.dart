import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/domain/entities/character_entity.dart';

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
            BattlesuitAppBar(character: character),
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

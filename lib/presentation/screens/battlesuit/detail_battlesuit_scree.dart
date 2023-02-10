import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/domain/entities/character_entity.dart';

import 'child/battlesuit_childs.dart';

class DetailBattlesuitScreen extends StatelessWidget {
  final CharacterEntity character;
  const DetailBattlesuitScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            DetailBattlesuitAppbar(character: character),
            Padding(
              padding: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 24, top: 24)
                  .r,
              child: Column(
                children: [
                  BattlesuitSpeciality(
                      battlesuitSpecialities: character.characterSpeciality!),
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
          ],
        ),
      ),
    );
  }
}

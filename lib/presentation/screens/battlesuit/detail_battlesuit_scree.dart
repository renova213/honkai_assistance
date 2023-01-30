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
      body: Column(
        children: [
          DetailBattlesuitAppbar(character: character),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 24, top: 24)
                    .r,
            child: Column(
              children: [
                BattlesuitSpeciality(
                    battlesuitSpecialities:
                        character.characterSpeciality != null
                            ? character.characterSpeciality!
                            : []),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

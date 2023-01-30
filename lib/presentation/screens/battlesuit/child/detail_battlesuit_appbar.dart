import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/style/style.dart';
import '../../../../domain/entities/character_entity.dart';

class DetailBattlesuitAppbar extends StatelessWidget {
  final CharacterEntity character;
  const DetailBattlesuitAppbar({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 150.h,
      decoration: BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
          image: CachedNetworkImageProvider(character.urlImageCharacter),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, top: 16).r,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back, color: Colors.white, size: 30.r),
            ),
            Center(
              child: Row(
                children: [
                  Image.network(character.urlImageATK,
                      width: 30.w, height: 30.h),
                  SizedBox(width: 8.w),
                  Text(character.characterName, style: AppFont.subtitle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

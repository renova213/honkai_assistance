import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/domain/entities/character_entity.dart';

import '../../../../common/style/style.dart';
import '../../../components/loading.dart';

class BattlesuitAppBar extends StatelessWidget {
  final CharacterEntity character;
  const BattlesuitAppBar({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
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
                  width: 130, height: double.maxFinite, borderRadius: 0),
            );
          },
        ),
      ),
    );
  }
}

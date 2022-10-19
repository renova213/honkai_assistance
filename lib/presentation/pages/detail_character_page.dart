import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:honkai_lab/common/style.dart';
import 'package:honkai_lab/domain/entities/character.dart';
import 'package:honkai_lab/presentation/pages/widgets/detail_character/equpment_character.dart';
import 'package:honkai_lab/presentation/pages/widgets/detail_character/menu_header_character.dart';
import 'package:honkai_lab/presentation/pages/widgets/detail_character/rank_up_character.dart';
import 'package:honkai_lab/presentation/providers/detail_character_provider.dart';
import 'package:provider/provider.dart';

import 'widgets/detail_character/profile_character.dart';

class DetailCharacterPage extends StatelessWidget {
  final Character data;
  const DetailCharacterPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black87,
          child: Consumer<DetailCharacterProvider>(
            builder: (context, notifier, _) => SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedContainer(
                    width: width,
                    height: notifier.indexItem != 0 ? 150 : 0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(data.image),
                      ),
                    ),
                    duration: const Duration(milliseconds: 300),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: notifier.indexItem != 0 ? 30 : 0,
                          ),
                        ),
                        Center(
                          child: Row(
                            children: [
                              Image.network(
                                data.elementImage,
                                width: 30,
                                height: 30,
                              ),
                              const SizedBox(width: 4),
                              Text(data.nameCharacter, style: subtitle)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const MenuHeaderCharacter(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          const SizedBox(height: 16),
                          notifier.indexItem == 0
                              ? ProfileCharacter(data: data)
                              : notifier.indexItem == 1
                                  ? const RankUpCharacter()
                                  : const EquipmentCharacter(),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

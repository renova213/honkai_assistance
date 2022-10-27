import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../common/style.dart';
import '../../../domain/entities/character.dart';
import '../../../responsive_layout.dart';

class CharacterTeamContainer extends StatelessWidget {
  final Detail detail;
  const CharacterTeamContainer({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: _listTeam(width),
    );
  }

  Widget _titleContainer(String title, double width) {
    return Container(
      height: 30,
      width: width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: Text(
        title,
        style: bodyText2.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _listTeam(double width) {
    return Center(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: detail.characterTeam.length,
        itemBuilder: (context, index) {
          final indexData = detail.characterTeam[index];
          return Column(
            children: [
              _titleContainer(indexData.nameTeam, width),
              const SizedBox(height: 16),
              Center(
                child: SizedBox(
                  width:
                      ResponsiveLayout.isMobile(context) ? width : width * 0.5,
                  height: 150,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: 3,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 16),
                    itemBuilder: (context, index) {
                      final data = indexData.characterTeam[index];
                      return SizedBox(
                        width: 100,
                        height: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CachedNetworkImage(
                                imageUrl: data.urlImage,
                                errorWidget: (context, url, error) {
                                  return const Center(
                                    child: Icon(Icons.error, color: Colors.red),
                                  );
                                },
                                placeholder: (context, url) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                                width: 100,
                                height: 100,
                                fit: BoxFit.fill),
                            const SizedBox(height: 8),
                            Center(
                              child: Text(
                                data.nameCharacter,
                                style: bodyText2.copyWith(
                                    overflow: TextOverflow.ellipsis),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              )
            ],
          );
        },
      ),
    );
  }
}

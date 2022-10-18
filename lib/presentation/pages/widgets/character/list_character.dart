import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:honkai_lab/common/utils/finite_state.dart';
import 'package:honkai_lab/presentation/providers/character_provider.dart';
import 'package:provider/provider.dart';

import '../../../../common/style.dart';

class ListCharacter extends StatelessWidget {
  const ListCharacter({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CharacterProvider>(
      builder: (context, notifier, _) => GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: notifier.listCharacters.length,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 8, crossAxisSpacing: 8, crossAxisCount: 2),
        itemBuilder: (context, index) {
          if (notifier.myState == MyState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (notifier.myState == MyState.failed) {
            return Center(
              child: Text("Failed get data from server", style: subtitle),
            );
          }

          final data = notifier.listCharacters[index];

          notifier.changeBottomBorderColor(data.element);
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 3, color: notifier.colorBottom),
                    ),
                  ),
                  child: CachedNetworkImage(
                      imageUrl: data.image,
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
                      fit: BoxFit.fill),
                ),
                const SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    data.nameCharacter,
                    style: bodyText2.copyWith(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

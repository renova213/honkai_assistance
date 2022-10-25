import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honkai_lab/common/navigator_fade_transition.dart';
import 'package:honkai_lab/presentation/pages/detail_character/detail_character_page.dart';
import 'package:honkai_lab/presentation/providers/tier_list_provider.dart';
import 'package:provider/provider.dart';

import '../../../common/style.dart';
import '../../../domain/entities/character.dart';
import '../../blocs/tier_list/tier_list_character_bloc/tier_list_character_bloc.dart';

class TierListDps extends StatelessWidget {
  const TierListDps({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return BlocBuilder<TierListCharacterBloc, TierListCharacterState>(
      builder: (
        context,
        state,
      ) {
        if (state is LoadingTierListCharacter) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is LoadedTierListCharacter) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              state.tierExDpsCharacters.isNotEmpty
                  ? _characterList(width, state.tierExDpsCharacters, 0)
                  : const SizedBox(),
              const SizedBox(height: 16),
              state.tierSDpsCharacter.isNotEmpty
                  ? _characterList(width, state.tierSDpsCharacter, 1)
                  : const SizedBox(),
              const SizedBox(height: 16),
              state.tierADpsCharacter.isNotEmpty
                  ? _characterList(width, state.tierADpsCharacter, 2)
                  : const SizedBox(),
              const SizedBox(height: 16),
              state.tierBDpsCharacter.isNotEmpty
                  ? _characterList(width, state.tierBDpsCharacter, 3)
                  : const SizedBox(),
              SizedBox(height: height * 0.1),
            ],
          );
        }

        return Text("failed get tier list character data from server",
            style: subtitle);
      },
    );
  }

  Widget _characterList(double width, List<Character> data, int indexTier) {
    return Consumer<TierListProvider>(
      builder: (context, state, _) => Container(
        decoration: BoxDecoration(
            color: indexTier == 0
                ? Colors.red
                : indexTier == 1
                    ? Colors.redAccent
                    : indexTier == 2
                        ? Colors.orange
                        : Colors.blue),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 50,
              alignment: Alignment.center,
              child: Text(
                data.isNotEmpty ? data[0].tier.toUpperCase() : "",
                style: bodyText1.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.black87),
              ),
            ),
            Container(
              width: width * 0.76,
              color: Colors.grey.shade800,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Consumer<TierListProvider>(
                  builder: (context, state, _) => GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: data.length,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      final items = data[index];

                      state.changeBottomBorderColor(items.element);

                      return GestureDetector(
                        onTap: () => Navigator.of(context).push(
                          NavigatorFadeTransition(
                            child: DetailCharacterPage(data: items),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              height: 90,
                              width: 55,
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      color: state.colorBottom, width: 3),
                                ),
                              ),
                              child: CachedNetworkImage(
                                  imageUrl: items.imageChibi,
                                  errorWidget: (context, url, error) {
                                    return const Center(
                                      child:
                                          Icon(Icons.error, color: Colors.red),
                                    );
                                  },
                                  placeholder: (context, url) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  },
                                  fit: BoxFit.cover),
                            ),
                            CachedNetworkImage(
                                imageUrl: items.elementImage,
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
                                height: 20,
                                width: 20),
                          ],
                        ),
                      );
                    },
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

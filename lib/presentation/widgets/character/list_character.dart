import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honkai_lab/common/navigator_fade_transition.dart';
import 'package:honkai_lab/presentation/blocs/character_bloc/character_bloc.dart';
import 'package:honkai_lab/presentation/providers/character_provider.dart';
import 'package:honkai_lab/responsive_layout.dart';
import 'package:provider/provider.dart';

import '../../../common/style.dart';
import '../../pages/detail_character/detail_character_page.dart';

class ListCharacter extends StatelessWidget {
  const ListCharacter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterBloc, CharacterState>(
      builder: (context, state) {
        if (state is LoadingCharacter) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is LoadedCharacter) {
          return Consumer<CharacterProvider>(
            builder: (context, notifier, _) => GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.characters.length,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  crossAxisCount: ResponsiveLayout.isMobile(context) ? 2 : 4),
              itemBuilder: (context, index) {
                final data = state.characters[index];

                notifier.changeBottomBorderColor(data.element);
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: InkWell(
                    onTap: () => Navigator.of(context).push(
                      NavigatorFadeTransition(
                        child: DetailCharacterPage(data: data),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 110,
                          height: 110,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  width: 3, color: notifier.colorBottom),
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
                            style:
                                bodyText2.copyWith(fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
        return Text("Failed get character data from server", style: subtitle);
      },
    );
  }
}

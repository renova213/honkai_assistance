import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honkai_lab/common/style.dart';
import 'package:honkai_lab/presentation/blocs/home/banner_character_bloc/banner_character_bloc.dart';

import '../../../responsive_layout.dart';

class CurrentBannerCharacter extends StatelessWidget {
  const CurrentBannerCharacter({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _headerTitle(width),
        _listBannerCharacters(width),
      ],
    );
  }

  Widget _headerTitle(double width) {
    return Container(
      width: width,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        border: Border.all(color: Colors.grey.shade800),
      ),
      child: Center(
        child: Text(
          "Current Banners Character",
          style: subtitle,
        ),
      ),
    );
  }

  Widget _listBannerCharacters(double width) {
    return BlocBuilder<BannerCharacterBloc, BannerCharacterState>(
      builder: (context, state) {
        if (state is LoadingBannerCharacter) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is LoadedBannerCharacter) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.characterBanners.length,
            itemBuilder: (context, index) {
              final data = state.characterBanners[index];

              return Container(
                width: width,
                height: ResponsiveLayout.isMobile(context) ? 100 : 120,
                decoration: BoxDecoration(
                  color:
                      index.isEven ? Colors.transparent : Colors.grey.shade800,
                  border: Border.all(color: Colors.grey.shade800, width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: ResponsiveLayout.isMobile(context) ? 85 : 100,
                        height: ResponsiveLayout.isMobile(context) ? 85 : 100,
                        child: GestureDetector(
                          onTap: () =>
                              _bottomSheet(data.urlImage, width, context),
                          child: CachedNetworkImage(
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
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            alignment: Alignment.centerRight,
                            width: width * 0.5,
                            child: Text(
                              data.nameCharacter,
                              style: subtitle,
                            ),
                          ),
                          Text(
                            "Ends on ${data.endDate}",
                            style: bodyText2,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        }
        return Center(
          child: Text("Failed get character banner data from server",
              style: subtitle),
        );
      },
    );
  }

  void _bottomSheet(String urlImage, double width, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: width * 0.05),
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              urlImage,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}

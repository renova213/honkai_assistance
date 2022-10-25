import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honkai_lab/common/style.dart';
import 'package:honkai_lab/presentation/blocs/home/weapon_stigmata_bloc/weapon_stigmata_bloc_bloc.dart';

class CurrentWeaponStigmataBanner extends StatelessWidget {
  const CurrentWeaponStigmataBanner({super.key});

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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Text(
            "Current Banners Weapon & Stigmatas",
            textAlign: TextAlign.center,
            style: subtitle,
          ),
        ),
      ),
    );
  }

  Widget _listBannerCharacters(double width) {
    return BlocBuilder<WeaponStigmataBloc, WeaponStigmataState>(
      builder: (context, state) {
        if (state is LoadingWeaponStigmataBanner) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is LoadedWeaponStigmataBanner) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.weaponStigmataBanners.length,
            itemBuilder: (context, index) {
              final data = state.weaponStigmataBanners[index];

              return Container(
                width: width,
                height: 200,
                decoration: BoxDecoration(
                  color:
                      index.isEven ? Colors.transparent : Colors.grey.shade800,
                  border: Border.all(color: Colors.grey.shade800, width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 85,
                            height: 85,
                            child: GestureDetector(
                              onTap: () => _bottomSheet(
                                  data.urlImageWeapon, width, context),
                              child: CachedNetworkImage(
                                imageUrl: data.urlImageWeapon,
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                data.nameWeapon,
                                style: subtitle,
                              ),
                              const Text(""),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 85,
                            height: 85,
                            child: GestureDetector(
                              onTap: () => _bottomSheet(
                                  data.urlImageStigmata, width, context),
                              child: CachedNetworkImage(
                                imageUrl: data.urlImageStigmata,
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
                            children: [
                              Text(
                                data.nameStigmata,
                                style: subtitle,
                              ),
                              const SizedBox(height: 32),
                              Text(
                                "Ends on ${data.endDate}",
                                style: bodyText2,
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
        return Text("Failed get weapon and stigmata data from server",
            style: subtitle);
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

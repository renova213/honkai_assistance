import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:honkai_lab/common/style.dart';
import 'package:honkai_lab/presentation/providers/home_provider.dart';
import 'package:provider/provider.dart';

class CurrentWeaponStigmataBanner extends StatefulWidget {
  const CurrentWeaponStigmataBanner({super.key});

  @override
  State<CurrentWeaponStigmataBanner> createState() =>
      _CurrentWeaponStigmataBannerState();
}

class _CurrentWeaponStigmataBannerState
    extends State<CurrentWeaponStigmataBanner> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<HomeProvider>(context, listen: false)
          .fetchWeaponStigmaBanner(),
    );
  }

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
          "Current Banners Weapon & Stigmatas",
          style: subtitle,
        ),
      ),
    );
  }

  Widget _listBannerCharacters(double width) {
    return Consumer<HomeProvider>(
      builder: (context, notifier, _) => ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: notifier.weaponStigmatasBanners.length,
        itemBuilder: (context, index) {
          final data = notifier.weaponStigmatasBanners[index];

          return Container(
            width: width,
            height: 200,
            decoration: BoxDecoration(
              color: index.isEven ? Colors.transparent : Colors.grey.shade800,
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
                          width: 180,
                          height: 85,
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
                )),
          );
        },
      ),
    );
  }
}

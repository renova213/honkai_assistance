import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:honkai_lab/common/style.dart';
import 'package:honkai_lab/common/utils/finite_state.dart';
import 'package:honkai_lab/presentation/providers/home_provider.dart';
import 'package:provider/provider.dart';

class CurrentBannerElf extends StatefulWidget {
  const CurrentBannerElf({super.key});

  @override
  State<CurrentBannerElf> createState() => _CurrentBannerElfState();
}

class _CurrentBannerElfState extends State<CurrentBannerElf> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<HomeProvider>(context, listen: false).fetchElfBanner(),
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
          "Current Banners Elf",
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
        itemCount: notifier.elfBanners.length,
        itemBuilder: (context, index) {
          final data = notifier.elfBanners[index];

          if (notifier.myState == MyState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (notifier.myState == MyState.failed) {
            return Center(
              child: Text("Failed Get Data From Server", style: subtitle),
            );
          }

          return Container(
            width: width,
            height: 100,
            decoration: BoxDecoration(
              color: index.isEven ? Colors.transparent : Colors.grey.shade800,
              border: Border.all(color: Colors.grey.shade800, width: 2),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 85,
                    height: 85,
                    child: GestureDetector(
                      onTap: () => _bottomSheet(data.urlImage, width),
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
                      Text(
                        data.nameElf,
                        style: subtitle,
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
      ),
    );
  }

  void _bottomSheet(String urlImage, double width) {
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: width * 0.05),
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              urlImage,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:honkai_lab/common/style.dart';
import 'package:provider/provider.dart';

import '../../providers/detail_character_provider.dart';

class MenuHeaderCharacterContainer extends StatelessWidget {
  const MenuHeaderCharacterContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 80,
      child: Consumer<DetailCharacterProvider>(
        builder: (context, notifier, _) => ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: notifier.listMenu.length,
          itemBuilder: (context, index) {
            final data = notifier.listMenu[index];
            return Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  notifier.changeIndexItem(index);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: width * 0.25,
                  height: 90,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          color: notifier.indexItem == index
                              ? Colors.red
                              : Colors.grey.shade800,
                          width: 3),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          width: 40,
                          height: 40,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(
                            data.menu,
                            style: bodyText2.copyWith(
                                color: notifier.indexItem == index
                                    ? Colors.red
                                    : Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

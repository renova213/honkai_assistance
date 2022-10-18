import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:honkai_lab/common/utils/finite_state.dart';
import 'package:honkai_lab/presentation/providers/tier_list_provider.dart';
import 'package:provider/provider.dart';

import '../../../../common/style.dart';

class TierListSupport extends StatefulWidget {
  const TierListSupport({super.key});

  @override
  State<TierListSupport> createState() => _TierListDpsState();
}

class _TierListDpsState extends State<TierListSupport> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<TierListProvider>(context, listen: false)
          .fetchCharacter("support");
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Consumer<TierListProvider>(
      builder: (context, notifier, _) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _characterList(width, notifier.tierExSupportCharacters, 0),
          const SizedBox(height: 16),
          _characterList(width, notifier.tierSSupportCharacters, 1),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _characterList(double width, dynamic data, int indexTier) {
    return Consumer<TierListProvider>(
      builder: (context, notifier, _) => Container(
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
                  builder: (context, notifier, _) => GridView.builder(
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

                      if (notifier.myState == MyState.loading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if (notifier.myState == MyState.failed) {
                        return Center(
                          child: Text("Failed get data from server",
                              style: subtitle),
                        );
                      }

                      notifier.changeBottomBorderColor(items.element);

                      return Stack(
                        children: [
                          Container(
                            height: 90,
                            width: 55,
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    color: notifier.colorBottom, width: 3),
                              ),
                            ),
                            child: CachedNetworkImage(
                                imageUrl: items.imageChibi,
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

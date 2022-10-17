import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:honkai_lab/common/utils/finite_state.dart';
import 'package:honkai_lab/presentation/providers/tier_list_provider.dart';
import 'package:provider/provider.dart';

import '../../../../common/style.dart';

class ChangeLog extends StatefulWidget {
  const ChangeLog({super.key});

  @override
  State<ChangeLog> createState() => _ChangelogState();
}

class _ChangelogState extends State<ChangeLog> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<TierListProvider>(context, listen: false)
          .fetchChangelog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        const Icon(Icons.history, color: Colors.blue, size: 20),
        TextButton(
          child: Text(
            "ChangeLog",
            style: bodyText2.copyWith(color: Colors.blue),
          ),
          onPressed: () {
            _changelog(context: context, width: width);
          },
        ),
      ],
    );
  }

  void _changelog({required BuildContext context, required double width}) {
    showDialog(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            color: Colors.grey.shade900,
            child: Consumer<TierListProvider>(
              builder: (context, notifier, _) => SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 60,
                      width: width,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey.shade700),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("ChangeLog", style: subtitle),
                            Material(
                              color: Colors.transparent,
                              child: IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(Icons.close,
                                    size: 25, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          notifier.changelogs.date.isNotEmpty
                              ? Text(notifier.changelogs.date, style: subtitle)
                              : const LinearProgressIndicator(),
                          const SizedBox(height: 16),
                          _listChangeLog(width),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _listChangeLog(double width) {
    return Consumer<TierListProvider>(
      builder: (context, notifier, _) => ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: notifier.changelogs.characterLog.length,
        itemBuilder: (context, index) {
          if (notifier.myState == MyState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (notifier.myState == MyState.failed) {
            return Text("Failed get data from server", style: subtitle);
          }

          final data = notifier.changelogs.characterLog[index];

          return Container(
            decoration: BoxDecoration(
              color: index.isOdd ? Colors.transparent : Colors.grey.shade800,
              border: Border.all(color: Colors.grey.shade700, width: 2),
            ),
            width: width,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 60,
                    height: 60,
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
                        fit: BoxFit.cover),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    data.nameCharacter,
                    style: bodyText2.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: data.tierBefore == "new"
                            ? Colors.blueAccent
                            : data.tierBefore == "ex"
                                ? Colors.red
                                : data.tierBefore == "s"
                                    ? Colors.redAccent
                                    : data.tierBefore == "a"
                                        ? Colors.orange
                                        : Colors.blue,
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        child: Text(
                          data.tierBefore.toUpperCase(),
                          style: bodyText2.copyWith(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.keyboard_arrow_right,
                          size: 20, color: Colors.white),
                      const SizedBox(width: 8),
                      Container(
                        color: data.tierCurrent == "ex"
                            ? Colors.red
                            : data.tierCurrent == "s"
                                ? Colors.redAccent
                                : data.tierCurrent == "a"
                                    ? Colors.orange
                                    : Colors.blue,
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        child: Text(
                          data.tierCurrent.toUpperCase(),
                          style: bodyText2.copyWith(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

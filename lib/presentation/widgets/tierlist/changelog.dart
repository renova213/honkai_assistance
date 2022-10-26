import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honkai_lab/domain/entities/changelog.dart';
import 'package:honkai_lab/presentation/blocs/tier_list/changelog_bloc/changelog_bloc.dart';
import 'package:honkai_lab/presentation/providers/tier_list_provider.dart';
import 'package:provider/provider.dart';

import '../../../common/style.dart';

class ChangeLog extends StatelessWidget {
  const ChangeLog({super.key});

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
            child: SingleChildScrollView(
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
                    child: BlocBuilder<ChangelogBloc, ChangelogState>(
                      builder: (context, state) {
                        if (state is LoadingChangelog) {
                          return const CircularProgressIndicator();
                        }
                        if (state is LoadedChangelog) {
                          return Column(
                            children: [
                              Text(state.changelogs.date, style: subtitle),
                              const SizedBox(height: 16),
                              _listChangeLog(width, state.changelogs),
                            ],
                          );
                        }
                        return Text("Failed get changelog data from server",
                            style: subtitle);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _listChangeLog(double width, Changelog data) {
    return Consumer<TierListProvider>(
      builder: (context, notifier, _) => ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: data.characterLog.length,
        itemBuilder: (context, index) {
          final items = data.characterLog[index];

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
                        imageUrl: items.urlImage,
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
                    items.nameCharacter,
                    style: bodyText2.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: items.tierBefore == "new"
                            ? Colors.blueAccent
                            : items.tierBefore == "ex"
                                ? Colors.red
                                : items.tierBefore == "s"
                                    ? Colors.redAccent
                                    : items.tierBefore == "a"
                                        ? Colors.orange
                                        : Colors.blue,
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        child: Text(
                          items.tierBefore.toUpperCase(),
                          style: bodyText2.copyWith(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.keyboard_arrow_right,
                          size: 20, color: Colors.white),
                      const SizedBox(width: 8),
                      Container(
                        color: items.tierCurrent == "ex"
                            ? Colors.red
                            : items.tierCurrent == "s"
                                ? Colors.redAccent
                                : items.tierCurrent == "a"
                                    ? Colors.orange
                                    : Colors.blue,
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        child: Text(
                          items.tierCurrent.toUpperCase(),
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

import 'package:flutter/material.dart';
import 'package:honkai_lab/domain/entities/rank_glossary.dart';
import 'package:honkai_lab/presentation/providers/tier_list_provider.dart';
import 'package:provider/provider.dart';

import '../../../common/style.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        const Icon(Icons.help, color: Colors.blue, size: 20),
        TextButton(
          child: Text(
            "Help",
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
                            Text("Glossary", style: subtitle),
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
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 8),
                            Text("Modes", style: subtitle),
                            const SizedBox(height: 8),
                            Text(
                                "Each character gets a rating based on how good it is in certain game mode. Below you will find a short description of all game modes available in game",
                                style: bodyText2),
                            const SizedBox(height: 16),
                            _containerMode(
                                mode: "Mode",
                                explanation: "Explanation",
                                indexColor: 0,
                                width: width),
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: notifier.listModeGame.length,
                              itemBuilder: (context, index) {
                                int indexColor = 1;

                                final data = notifier.listModeGame[index];

                                if (index.isEven) indexColor = 1;
                                if (index.isOdd) indexColor = 2;

                                return _containerMode(
                                    mode: data.mode,
                                    explanation: data.explanation,
                                    indexColor: indexColor,
                                    width: width);
                              },
                            ),
                            const SizedBox(height: 16),
                            _containerMode(
                                mode: "Rating",
                                explanation: "Explanation",
                                indexColor: 0,
                                width: width),
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: notifier.rankGlossaries.length,
                              itemBuilder: (context, index) {
                                final data = notifier.rankGlossaries[index];

                                return _containerRank(
                                    data: data, index: index, width: width);
                              },
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
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

  Widget _containerMode(
      {required String mode,
      required String explanation,
      required int indexColor,
      required double width}) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: indexColor == 0
                  ? Colors.grey.shade700
                  : indexColor == 1
                      ? Colors.grey.shade800
                      : Colors.transparent,
              border: Border.all(color: Colors.grey.shade700),
            ),
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                mode,
                style: bodyText2.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: indexColor == 0
                  ? Colors.grey.shade700
                  : indexColor == 1
                      ? Colors.grey.shade800
                      : Colors.transparent,
              border: Border.all(color: Colors.grey.shade700),
            ),
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Text(
                  explanation,
                  style: indexColor == 0
                      ? bodyText2.copyWith(fontWeight: FontWeight.bold)
                      : bodyText2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _containerRank(
      {required RankGlossary data, required int index, required double width}) {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: data.tier == "ex"
                ? Colors.red
                : data.tier == "s"
                    ? Colors.redAccent
                    : data.tier == "a"
                        ? Colors.orange
                        : Colors.blue,
            border: Border.all(color: Colors.grey.shade700),
          ),
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Center(
              child: Text(
                data.tier.toUpperCase(),
                style: bodyText2.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: index.isOdd ? Colors.grey.shade800 : Colors.transparent,
              border: Border.all(color: Colors.grey.shade700),
            ),
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Text(
                  data.explanation,
                  style: bodyText2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

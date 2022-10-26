import 'package:flutter/material.dart';
import 'package:honkai_lab/domain/entities/character.dart';

import '../../../common/style.dart';

class ElysianRealmContainer extends StatelessWidget {
  final Detail detail;
  const ElysianRealmContainer({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Scrollbar(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            width: width,
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _titleContainer("Recommended Setup", width),
                  const SizedBox(height: 16),
                  _table3Column(
                      string1: "Support 1",
                      string2: "Support 2",
                      string3: "Utility",
                      indexColor: 0,
                      width: width),
                  _listViewItem3Column(width: width),
                  const SizedBox(height: 16),
                  _table2Column(
                      string1: "Time",
                      string2: "Emblem",
                      indexColor: 0,
                      width: width,
                      flex1: 1,
                      flex2: 2),
                  _listViewItem2Column(
                      width: width,
                      flex1: 1,
                      flex2: 2,
                      listData: detail
                          .characterElysianRealm.recommendedSetup.emblemSetup),
                  const SizedBox(height: 16),
                  _table2Column(
                      string1: "Signet",
                      string2: "Choice",
                      indexColor: 0,
                      width: width,
                      flex1: 3,
                      flex2: 1),
                  _listViewItem2Column(
                      width: width,
                      flex1: 3,
                      flex2: 1,
                      listData: detail
                          .characterElysianRealm.recommendedSetup.setupSignet),
                  const SizedBox(height: 16),
                  _titleContainer("Core Signet", width),
                  const SizedBox(height: 16),
                  _table2Column(
                      string1: "Signet",
                      string2: "Choice",
                      indexColor: 0,
                      width: width,
                      flex1: 1,
                      flex2: 3),
                  _listViewItem2Column(
                      width: width,
                      flex1: 1,
                      flex2: 3,
                      listData: detail.characterElysianRealm.coreSignet),
                  const SizedBox(height: 16),
                  _titleContainer("Reinforcement Signet", width),
                  const SizedBox(height: 16),
                  _table2Column(
                      string1: "Signet",
                      string2: "Choice",
                      indexColor: 0,
                      width: width,
                      flex1: 1,
                      flex2: 3),
                  _listViewItem2Column(
                      width: width,
                      flex1: 1,
                      flex2: 3,
                      listData:
                          detail.characterElysianRealm.reinforcementSignet),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _titleContainer(String title, double width) {
    return Container(
      height: 30,
      width: width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: Text(
        title,
        style: bodyText2.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _table3Column(
      {required String string1,
      required String string2,
      required String string3,
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
                  ? Colors.grey.shade600
                  : indexColor.isOdd
                      ? Colors.grey.shade700
                      : Colors.transparent,
              border: Border.all(
                  color: indexColor == 0
                      ? Colors.grey.shade700
                      : Colors.grey.shade600),
            ),
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                string1,
                style: indexColor == 0
                    ? bodyText2.copyWith(fontWeight: FontWeight.bold)
                    : bodyText2,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: indexColor == 0
                  ? Colors.grey.shade600
                  : indexColor.isOdd
                      ? Colors.grey.shade700
                      : Colors.transparent,
              border: Border.all(
                  color: indexColor == 0
                      ? Colors.grey.shade700
                      : Colors.grey.shade600),
            ),
            alignment:
                indexColor == 0 ? Alignment.center : Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Text(
                  string2,
                  style: indexColor == 0
                      ? bodyText2.copyWith(fontWeight: FontWeight.bold)
                      : bodyText2,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: indexColor == 0
                  ? Colors.grey.shade600
                  : indexColor.isOdd
                      ? Colors.grey.shade700
                      : Colors.transparent,
              border: Border.all(
                  color: indexColor == 0
                      ? Colors.grey.shade700
                      : Colors.grey.shade600),
            ),
            alignment:
                indexColor == 0 ? Alignment.center : Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Text(
                  string3,
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

  Widget _table2Column(
      {required String string1,
      required String string2,
      required int indexColor,
      required double width,
      required int flex1,
      required int flex2}) {
    return Row(
      children: [
        Expanded(
          flex: flex1,
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: indexColor == 0
                  ? Colors.grey.shade600
                  : indexColor.isOdd
                      ? Colors.grey.shade700
                      : Colors.transparent,
              border: Border.all(
                  color: indexColor == 0
                      ? Colors.grey.shade700
                      : Colors.grey.shade600),
            ),
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                string1,
                style: bodyText2.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Expanded(
          flex: flex2,
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: indexColor == 0
                  ? Colors.grey.shade600
                  : indexColor.isOdd
                      ? Colors.grey.shade700
                      : Colors.transparent,
              border: Border.all(
                  color: indexColor == 0
                      ? Colors.grey.shade700
                      : Colors.grey.shade600),
            ),
            alignment:
                indexColor == 0 ? Alignment.center : Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Text(
                  string2,
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

  Widget _listViewItem3Column({required double width}) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount:
          detail.characterElysianRealm.recommendedSetup.supportSetup.length,
      itemBuilder: (context, index) {
        final data =
            detail.characterElysianRealm.recommendedSetup.supportSetup[index];
        return _table3Column(
            string1: data.contents1,
            string2: data.contents2,
            string3: data.contents3,
            indexColor: index + 1,
            width: width);
      },
    );
  }

  Widget _listViewItem2Column(
      {required double width,
      required int flex1,
      required int flex2,
      required dynamic listData}) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: listData.length,
      itemBuilder: (context, index) {
        final data = listData[index];
        return _table2Column(
            string1: data.contents1,
            string2: data.contents2,
            indexColor: index + 1,
            width: width,
            flex1: flex1,
            flex2: flex2);
      },
    );
  }
}

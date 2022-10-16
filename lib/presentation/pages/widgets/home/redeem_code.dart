import 'package:flutter/material.dart';
import 'package:honkai_lab/common/style.dart';
import 'package:honkai_lab/presentation/providers/home_provider.dart';
import 'package:provider/provider.dart';

import '../../../../common/utils/finite_state.dart';

class RedeemCode extends StatefulWidget {
  const RedeemCode({super.key});

  @override
  State<RedeemCode> createState() => _RedeemCodeState();
}

class _RedeemCodeState extends State<RedeemCode> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () =>
          Provider.of<HomeProvider>(context, listen: false).fetchActiveCodes(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Consumer<HomeProvider>(
      builder: (context, notifier, _) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          notifier.codesSea.isEmpty || notifier.codesGlobal.isEmpty
              ? _oneServerCode(notifier)
              : _allServer(notifier),
          const SizedBox(height: 32),
          Container(
            height: 110,
            width: width,
            decoration: const BoxDecoration(
              color: Colors.transparent,
              border: Border(
                bottom: BorderSide(color: Colors.blue, width: 3),
              ),
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: notifier.indexServer == 0
                  ? notifier.codesSea.length
                  : notifier.codesGlobal.length,
              itemBuilder: (context, index) {
                final data = notifier.indexServer == 0
                    ? notifier.codesSea[index]
                    : notifier.codesGlobal[index];

                final length = notifier.indexServer == 0
                    ? notifier.codesSea.length
                    : notifier.codesGlobal.length;

                if (notifier.myState == MyState.loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (notifier.myState == MyState.failed) {
                  return Center(
                    child: Text(
                      "Failed get this data from server",
                      style: subtitle,
                    ),
                  );
                }
                return SizedBox(
                  width: width * 0.9,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(data.code, style: subtitle),
                        const SizedBox(height: 16),
                        Text(data.reward,
                            style: bodyText2, textAlign: TextAlign.center),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "${index + 1} / $length",
                              style: bodyText2.copyWith(
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _allServer(HomeProvider notifier) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.center,
            height: 50,
            decoration: const BoxDecoration(
              color: Colors.transparent,
              border: Border(
                bottom: BorderSide(color: Colors.blue, width: 3),
              ),
            ),
            child: Text("Active Codes", style: subtitle),
          ),
        ),
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () => notifier.changeIndexServer(0),
            child: Container(
              alignment: Alignment.center,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border(
                  bottom: notifier.indexServer == 0
                      ? const BorderSide(color: Colors.red, width: 3)
                      : BorderSide(color: Colors.grey.shade700, width: 1),
                ),
              ),
              child: Text("SEA",
                  style: notifier.indexServer == 0
                      ? bodyText1.copyWith(fontWeight: FontWeight.bold)
                      : bodyText1),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () => notifier.changeIndexServer(1),
            child: Container(
              alignment: Alignment.center,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border(
                  bottom: notifier.indexServer == 1
                      ? const BorderSide(color: Colors.red, width: 3)
                      : BorderSide(color: Colors.grey.shade700, width: 1),
                ),
              ),
              child: Text("Global",
                  style: notifier.indexServer == 1
                      ? bodyText1.copyWith(fontWeight: FontWeight.bold)
                      : bodyText1),
            ),
          ),
        ),
      ],
    );
  }

  Widget _oneServerCode(HomeProvider notifier) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.center,
            height: 50,
            decoration: const BoxDecoration(
              color: Colors.transparent,
              border: Border(
                bottom: BorderSide(color: Colors.blue, width: 3),
              ),
            ),
            child: Text("Active Codes", style: subtitle),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            alignment: Alignment.center,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade700, width: 1),
              ),
            ),
            child: Text(
                notifier.codesGlobal.isEmpty
                    ? "Only for the SEA server"
                    : "Only for the global server",
                style: bodyText1),
          ),
        ),
      ],
    );
  }
}

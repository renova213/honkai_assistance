import 'package:flutter/material.dart';
import 'package:honkai_lab/presentation/providers/home_provider.dart';
import 'package:provider/provider.dart';

class RedeemCode extends StatelessWidget {
  const RedeemCode({super.key});

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
            height: 100,
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

                return SizedBox(
                  width: width * 0.9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data.code,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        data.reward,
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "${index + 1} / $length",
                            style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          )
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
            child: const Text(
              "Active Codes",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
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
              child: Text(
                "Sea",
                style: notifier.indexServer == 0
                    ? const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)
                    : const TextStyle(color: Colors.white),
              ),
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
              child: Text(
                "Global",
                style: notifier.indexServer == 1
                    ? const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)
                    : const TextStyle(color: Colors.white),
              ),
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
            child: const Text(
              "Active Codes",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
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
                  ? "Only for the sea server"
                  : "Only for the global server",
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

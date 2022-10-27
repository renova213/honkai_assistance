import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honkai_lab/common/style.dart';
import 'package:honkai_lab/presentation/providers/home_provider.dart';
import 'package:provider/provider.dart';

import '../../blocs/home/redeem_code_bloc/redeem_code_bloc.dart';

class RedeemCode extends StatelessWidget {
  const RedeemCode({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Consumer<HomeProvider>(
      builder: (context, notifier, _) =>
          BlocBuilder<RedeemCodeBloc, RedeemCodeState>(
        builder: (context, state) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            state is ActiveCodeState
                ? state.codesSea.isEmpty || state.codesGlobal.isEmpty
                    ? _oneServerCode(state)
                    : _allServer(notifier)
                : _oneServerCode(state),
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
              child: BlocBuilder<RedeemCodeBloc, RedeemCodeState>(
                builder: (context, state) {
                  if (state is LoadingRedeemCode) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is ActiveCodeState) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: notifier.indexServer == 0
                          ? state.codesSea.length
                          : state.codesGlobal.length,
                      itemBuilder: (context, index) {
                        final data = notifier.indexServer == 0
                            ? state.codesSea[index]
                            : state.codesGlobal[index];

                        final length = notifier.indexServer == 0
                            ? state.codesSea.length
                            : state.codesGlobal.length;

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
                                    style: bodyText2,
                                    textAlign: TextAlign.center),
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
                    );
                  }
                  return Center(
                      child:
                          Text("Failed get data from server", style: subtitle));
                },
              ),
            ),
          ],
        ),
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

  Widget _oneServerCode(RedeemCodeState state) {
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
                state is ActiveCodeState
                    ? state.codesGlobal.isEmpty
                        ? "Only for the SEA server"
                        : "Only for the global server"
                    : "Empty",
                style: bodyText1),
          ),
        ),
      ],
    );
  }
}

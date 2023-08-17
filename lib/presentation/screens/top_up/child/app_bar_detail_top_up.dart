import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/presentation/provider/top_up_checkout_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../common/style/style.dart';

class AppBarDetailTopUp extends StatefulWidget {
  const AppBarDetailTopUp({super.key});

  @override
  State<AppBarDetailTopUp> createState() => _AppBarDetailTopUpState();
}

class _AppBarDetailTopUpState extends State<AppBarDetailTopUp> {
  late DateTime targetDateTime;
  DateTime currentDateTime = DateFormat('dd MMMM yyyy hh:mm:ss')
      .parse(DateFormat('dd MMMM yyyy hh:mm:ss').format(DateTime.now()));
  late Timer timer;
  String countDown = '';

  @override
  void initState() {
    super.initState();

    _countDownTimer();
  }

  void _countDownTimer() async {
    targetDateTime = Provider.of<TopUpCheckoutProvider>(context, listen: false)
        .topUpCheckout!
        .expiredAtFormat;

    await _timer();
  }

  Future<void> _timer() async {
    await Future.microtask(() {
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          String temporaryCurrentDateTime =
              DateFormat('dd MMMM yyyy hh:mm:ss').format(DateTime.now());

          currentDateTime = DateFormat('dd MMMM yyyy hh:mm:ss')
              .parse(temporaryCurrentDateTime);

          Duration timeDifference = targetDateTime.difference(currentDateTime);
          if (timeDifference.isNegative) {
            countDown = "Expired";
          } else {
            countDown =
                '${timeDifference.inHours}:${timeDifference.inMinutes.remainder(60).toString().padLeft(2, '0')}:${timeDifference.inSeconds.remainder(60).toString().padLeft(2, '0')}';
          }
        });
      });
    });
  }

  @override
  void dispose() {
    super.dispose();

    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: Stack(
        children: [
          ShaderMask(
            blendMode: BlendMode.dstIn,
            shaderCallback: (Rect bounds) {
              return const LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [Colors.transparent, Colors.black],
              ).createShader(bounds);
            },
            child: Image.asset('assets/images/honkai.jpg',
                fit: BoxFit.fill,
                height: double.maxFinite,
                width: double.maxFinite),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 24, top: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.withOpacity(0.5)),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back,
                            color: Colors.white, size: 32)),
                  ),
                  Center(
                    child: Consumer<TopUpCheckoutProvider>(
                      builder: (context, topUpCheckout, _) => topUpCheckout
                                  .topUpCheckout!.status ==
                              1
                          ? Padding(
                              padding: const EdgeInsets.only(top: 24),
                              child: Text("The order has been paid",
                                  style: AppFont.headline6
                                      .copyWith(color: Colors.greenAccent)),
                            )
                          : topUpCheckout.topUpCheckout!.status == 2
                              ? const SizedBox()
                              : Column(
                                  children: [
                                    Text("Complete payment in",
                                        style: AppFont.headline6),
                                    SizedBox(height: 8.h),
                                    Text(countDown,
                                        style: AppFont.headline6.copyWith(
                                            color: const Color(0xFFd18002))),
                                    SizedBox(height: 8.h),
                                    Text("Payment deadline",
                                        style: AppFont.largeText),
                                    Consumer<TopUpCheckoutProvider>(
                                        builder: (context, topUpCheckout, _) =>
                                            Text(
                                                topUpCheckout
                                                    .topUpCheckout!.expiredAt,
                                                style: AppFont.subtitle)),
                                  ],
                                ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

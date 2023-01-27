import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/common/util/navigator_fade_helper.dart';

import '../../common/style/style.dart';
import 'home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AssetImage? assetImage;
  startTime() async {
    await Future.delayed(
      const Duration(seconds: 2),
      () => Navigator.of(context).pushReplacement(
        NavigatorFadeHelper(
          child: const HomeScreen(),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    assetImage = const AssetImage('assets/images/crystal.png');
    startTime();
  }

  @override
  void didChangeDependencies() {
    precacheImage(assetImage!, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: AppColor.primaryColor),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.r),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: assetImage!,
                          ),
                        ),
                      ),
                      Text("HonkaiAssistance", style: AppFont.headline6),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text("Honkai Impact 3 Guide & Tier List",
                      style: AppFont.smallText),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

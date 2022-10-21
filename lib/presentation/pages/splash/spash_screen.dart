import 'package:flutter/material.dart';
import 'package:honkai_lab/common/style.dart';
import '../../../common/navigator_fade_transition.dart';
import '../home/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AssetImage? assetImage;
  startTime() async {
    await Future.delayed(
      const Duration(seconds: 1),
      () => Navigator.of(context).pushReplacement(
        NavigatorFadeTransition(
          child: const HomePage(),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    assetImage = const AssetImage('assets/crystal.png');
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
        decoration: const BoxDecoration(color: Colors.black87),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(
              16,
            ),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: assetImage!,
                        ),
                      ),
                    ),
                    Text("Honkai Lab", style: headline6),
                  ],
                ),
                const SizedBox(height: 8),
                Text("Honkai Impact 3 Guide & Tier List", style: bodyText2),
              ],
            )),
          ),
        ),
      ),
    );
  }
}

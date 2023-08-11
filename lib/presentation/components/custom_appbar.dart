import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/common/util/utils.dart';
import 'package:honkai_assistance/presentation/provider/auth_provider.dart';
import 'package:honkai_assistance/presentation/screens/chat/chat_screen.dart';
import 'package:provider/provider.dart';

import '../../common/style/style.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: 60.h,
      width: double.maxFinite,
      child: Consumer<AuthProvider>(
        builder: (context, auth, _) => Row(
          children: [
            const SizedBox(width: 16),
            Image.asset('assets/images/crystal.png', width: 40, height: 40),
            Text(
              "HonkaiAssistance",
              style: AppFont.headline6,
            ),
            const Spacer(),
            IconButton(
                onPressed: () {
                  auth.emailUser.isEmpty
                      ? _alertDialog(context)
                      : Navigator.of(context).push(
                          NavigatorFadeHelper(child: const ChatScreen()),
                        );
                },
                icon: const Icon(Icons.storefront, color: Colors.white)),
            IconButton(
                onPressed: () {
                  auth.emailUser.isEmpty
                      ? _alertDialog(context)
                      : Navigator.of(context).push(
                          NavigatorFadeHelper(child: const ChatScreen()),
                        );
                },
                icon: const Icon(Icons.message, color: Colors.white)),
          ],
        ),
      ),
    );
  }

  void _alertDialog(context) {
    showDialog(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: AlertDialog(
          title: Container(
            padding: const EdgeInsets.only(bottom: 8),
            decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey))),
            alignment: Alignment.topRight,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                Text("Login First",
                    style: AppFont.largeText.copyWith(color: Colors.black)),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                )
              ],
            ),
          ),
          content: SizedBox(
            height: 150.h,
            child: Center(
              child: Consumer<AuthProvider>(
                builder: (context, auth, _) => InkWell(
                  onTap: () async {
                    await auth
                        .googleSignIn()
                        .then(
                          (_) => ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Berhasil Login")),
                          ),
                        )
                        .then((_) => Navigator.pop(context));
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: Image.asset(
                      "assets/images/google.png",
                      width: 80.w,
                      height: 80.h,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

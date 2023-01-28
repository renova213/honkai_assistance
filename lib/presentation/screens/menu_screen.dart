import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/presentation/providers/custom_sidebar_provider.dart';
import 'package:honkai_assistance/presentation/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

import '../widgets/side_bar.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          duration: Duration(seconds: 1),
          content: Text('Tap back again to exit'),
        ),
        child: SafeArea(
          child: Container(
            color: Colors.black87,
            child: Consumer<CustomSidebarProvider>(
              builder: (context, notifier, _) => GestureDetector(
                onTap: () {
                  notifier.isExpanded(false);
                  notifier.index(0);
                },
                child: Scrollbar(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const CustomAppBar(),
                        Stack(
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 24,
                                        bottom: 24)
                                    .r,
                                child: notifier.pages[notifier.indexPage]),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                SideBar(),
                              ],
                            ),
                          ],
                        ),
                      ],
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

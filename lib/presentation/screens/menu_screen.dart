import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/presentation/components/custom_appbar.dart';
import 'package:honkai_assistance/presentation/provider/button/sidebar_button_provider.dart';
import 'package:provider/provider.dart';

import '../provider/local/sidebar_provider.dart';
import '../components/side_bar.dart';

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
          child: GestureDetector(
            child: Container(
              color: Colors.black87,
              child: Consumer<SidebarButtonProvider>(
                builder: (context, sidebarButton, _) =>
                    Consumer<SidebarProvider>(
                  builder: (context, sidebar, _) => GestureDetector(
                    onTap: () {
                      sidebarButton.isExpanded(false);
                      sidebarButton.index(0);
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const CustomAppBar(),
                        Expanded(
                          child: Stack(
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(
                                          top: 24,
                                          left: 20,
                                          right: 20,
                                          bottom: 24)
                                      .r,
                                  child:
                                      sidebar.pages[sidebarButton.indexPage]),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  SideBar(),
                                ],
                              ),
                            ],
                          ),
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

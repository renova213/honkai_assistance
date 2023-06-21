import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/common/style/font_style.dart';
import 'package:honkai_assistance/presentation/components/custom_appbar.dart';
import 'package:honkai_assistance/presentation/provider/navbar_provider.dart';
import 'package:provider/provider.dart';

class NavbarScreen extends StatelessWidget {
  const NavbarScreen({super.key});
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
            child: Column(
              children: [
                const CustomAppBar(),
                Expanded(
                  child: Stack(
                    children: [
                      _currentPage(),
                      _customNavBar(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Consumer _currentPage() {
    return Consumer<NavbarProvider>(
      builder: (context, navbar, child) {
        return Padding(
          padding:
              const EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 24).r,
          child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              child: navbar.pages[navbar.currentIndex]),
        );
      },
    );
  }

  Align _customNavBar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.maxFinite,
        height: 80.h,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        color: Colors.black.withOpacity(0.7),
        child: Consumer<NavbarProvider>(
          builder: (context, navbar, _) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              navbar.navBarItems.length,
              (index) {
                final data = navbar.navBarItems[index];

                return InkWell(
                  onTap: () {
                    navbar.changeIndex(index);
                  },
                  child: _navBarItem(data['title'], data['assetImage'],
                      navbar.currentIndex == index),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Column _navBarItem(String title, String assetImage, bool hit) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: hit == true ? 40.w : 30.w,
          height: hit == true ? 40.w : 30.w,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(assetImage))),
        ),
        SizedBox(height: 4.h),
        AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          style: hit == true
              ? AppFont.mediumText
              : AppFont.smallText
                  .copyWith(color: Colors.white.withOpacity(0.5)),
          child: Text(title),
        ),
      ],
    );
  }
}

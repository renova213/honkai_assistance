import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/presentation/provider/button/sidebar_button_provider.dart';
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
      child: Row(
        children: [
          const SizedBox(width: 16),
          Image.asset('assets/images/crystal.png', width: 40, height: 40),
          Text(
            "HonkaiAssistance",
            style: AppFont.headline6,
          ),
          const Spacer(),
          Consumer<SidebarButtonProvider>(
            builder: (context, sidebarButton, _) => IconButton(
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, anim) => RotationTransition(
                  turns: child.key == const ValueKey('icon1')
                      ? Tween<double>(begin: 1, end: 0.75).animate(anim)
                      : Tween<double>(begin: 0.75, end: 1).animate(anim),
                  child: ScaleTransition(scale: anim, child: child),
                ),
                child: sidebarButton.currentIndex == 0
                    ? const Icon(
                        Icons.menu,
                        color: Colors.white,
                        key: ValueKey('icon1'),
                      )
                    : const Icon(
                        Icons.close,
                        color: Colors.white,
                        key: ValueKey('icon2'),
                      ),
              ),
              onPressed: () {
                sidebarButton.currentIndex == 0
                    ? sidebarButton.index(1)
                    : sidebarButton.index(0);
                sidebarButton.isExpand == false
                    ? sidebarButton.isExpanded(true)
                    : sidebarButton.isExpanded(false);
              },
            ),
          )
        ],
      ),
    );
  }
}

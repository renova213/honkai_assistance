import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/presentation/providers/custom_sidebar_provider.dart';
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
          Consumer<CustomSidebarProvider>(
            builder: (context, header, _) => IconButton(
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, anim) => RotationTransition(
                  turns: child.key == const ValueKey('icon1')
                      ? Tween<double>(begin: 1, end: 0.75).animate(anim)
                      : Tween<double>(begin: 0.75, end: 1).animate(anim),
                  child: ScaleTransition(scale: anim, child: child),
                ),
                child: header.currentIndex == 0
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
                header.currentIndex == 0 ? header.index(1) : header.index(0);
                header.isExpand == false
                    ? header.isExpanded(true)
                    : header.isExpanded(false);
              },
            ),
          )
        ],
      ),
    );
  }
}

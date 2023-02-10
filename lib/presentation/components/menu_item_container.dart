import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/style/style.dart';
import '../../common/util/utils.dart';

class MenuItemContainer extends StatelessWidget {
  final String title;
  final String assetImage;
  final Widget screen;
  const MenuItemContainer(
      {super.key,
      required this.title,
      required this.assetImage,
      required this.screen});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        NavigatorFadeHelper(child: screen),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.containerColor,
          border: Border.all(color: AppColor.borderColor, width: 2),
          borderRadius: BorderRadius.circular(5),
        ),
        height: 55.h,
        width: double.maxFinite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 53.h,
              width: 53.w,
              child: Image.asset(assetImage, fit: BoxFit.fill),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Row(
                children: [
                  Text(title,
                      style: AppFont.mediumText
                          .copyWith(fontWeight: FontWeight.bold)),
                  const Spacer(),
                  const Icon(Icons.keyboard_double_arrow_right,
                      size: 24, color: Colors.white),
                  SizedBox(width: 8.w),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

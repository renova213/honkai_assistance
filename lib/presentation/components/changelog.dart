import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../common/style/style.dart';
import '../provider/local/glossary_provider.dart';

class Changelog extends StatefulWidget {
  const Changelog({super.key});

  @override
  State<Changelog> createState() => _HelpState();
}

class _HelpState extends State<Changelog> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              _glossary(context: context);
            },
            child: Row(
              children: [
                const Icon(Icons.history, color: AppColor.red),
                SizedBox(width: 8.w),
                Text("Changelog",
                    style: AppFont.smallText.copyWith(color: AppColor.red)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _glossary({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(16.r),
          child: Container(
            color: AppColor.secondaryColor,
            child: Consumer<GlossaryProvider>(
              builder: (context, notifier, _) => SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 60.h,
                      width: double.maxFinite,
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Color(0xff616161)),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Changelog", style: AppFont.subtitle),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () => Navigator.pop(context),
                                child: Icon(Icons.close,
                                    size: 24.r, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

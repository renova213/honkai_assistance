import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/presentation/components/loading.dart';
import 'package:honkai_assistance/presentation/provider/firestore/changelog_provider.dart';
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
      () {
        Provider.of<ChangelogProvider>(context, listen: false).getchangelogs();
      },
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
              _changelog(context: context);
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

  void _changelog({required BuildContext context}) {
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
                    _listChangeLog(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _listChangeLog() {
    return Consumer<ChangelogProvider>(
      builder: (context, notifier, _) => ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: notifier.changelogs.length,
        itemBuilder: (context, index) {
          final data = notifier.changelogs[index];
          notifier.afterColorTier(data.tierAfter);
          notifier.beforeColorTier(data.tierBefore);

          return Container(
            decoration: BoxDecoration(
              color: index.isOdd ? Colors.transparent : Colors.grey.shade800,
              border: Border.all(color: Colors.grey.shade700, width: 2),
            ),
            width: double.maxFinite,
            child: Padding(
              padding: EdgeInsets.all(16.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 60.w,
                    height: 60.h,
                    child: CachedNetworkImage(
                        imageUrl: data.image,
                        errorWidget: (context, url, error) {
                          return const Center(
                            child: Icon(Icons.error, color: Colors.red),
                          );
                        },
                        placeholder: (context, url) {
                          return const Loading(
                              width: 60, height: 60, borderRadius: 0);
                        },
                        fit: BoxFit.cover),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    data.name,
                    style: AppFont.boldSmallText,
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: notifier.beforeTierColor,
                        width: 40.w,
                        height: 40.h,
                        alignment: Alignment.center,
                        child: Text(
                          data.tierBefore.toUpperCase(),
                          style: AppFont.boldSmallText,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      const Icon(Icons.keyboard_arrow_right,
                          color: Colors.white),
                      SizedBox(width: 8.w),
                      Container(
                        color: notifier.afterTierColor,
                        width: 40.w,
                        height: 40.h,
                        alignment: Alignment.center,
                        child: Text(
                          data.tierAfter.toUpperCase(),
                          style: AppFont.boldSmallText,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

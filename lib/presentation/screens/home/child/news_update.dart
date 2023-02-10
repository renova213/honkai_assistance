import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/presentation/components/loading.dart';
import 'package:honkai_assistance/presentation/components/title_line.dart';
import 'package:provider/provider.dart';

import '../../../../common/style/style.dart';
import '../../../../common/util/utils.dart';
import '../../../provider/firestore/news_update_provider.dart';
import '../../in_app_browser_screen.dart';

class NewsUpdate extends StatelessWidget {
  const NewsUpdate({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleLine(title: "News Update", fontSize: 16, height: 40),
        SizedBox(height: 16.h),
        _listUpdate(),
      ],
    );
  }

  Widget _listUpdate() {
    return Consumer<NewsUpdateProvider>(
      builder: (context, notifier, _) {
        if (notifier.appstate == AppState.loaded) {
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: notifier.newsUpdates.length <= 3
                ? notifier.newsUpdates.length
                : 3,
            separatorBuilder: (context, index) => const SizedBox(height: 32),
            itemBuilder: (context, index) {
              final data = notifier.newsUpdates[index];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      NavigatorFadeHelper(
                        child: WebViewScreen(urlWeb: data.urlWeb),
                      ),
                    ),
                    child: Container(
                      width: double.maxFinite,
                      height: 200.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColor.blue, width: 3),
                      ),
                      child: CachedNetworkImage(
                          imageUrl: data.urlImage,
                          errorWidget: (context, url, error) {
                            return const Center(
                              child: Icon(Icons.error, color: AppColor.red),
                            );
                          },
                          placeholder: (context, url) {
                            return const Loading(
                                width: double.maxFinite,
                                height: double.maxFinite,
                                borderRadius: 0);
                          },
                          fit: BoxFit.fill),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(data.title,
                      style: AppFont.subtitle,
                      textAlign: TextAlign.center,
                      maxLines: 2),
                  const SizedBox(height: 8),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text(data.description,
                        style: AppFont.smallText, textAlign: TextAlign.justify),
                  ),
                ],
              );
            },
          );
        }
        return _loading();
      },
    );
  }

  Widget _loading() {
    return Column(
      children: [
        SizedBox(height: 16.h),
        const Loading(width: double.maxFinite, height: 200, borderRadius: 0),
        SizedBox(height: 16.h),
        const Loading(width: 250, height: 20, borderRadius: 0),
        SizedBox(height: 8.h),
        const Loading(width: double.maxFinite, height: 15, borderRadius: 0),
        SizedBox(height: 8.h),
        const Loading(width: double.maxFinite, height: 15, borderRadius: 0),
      ],
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/presentation/blocs/news_update/news_update_bloc.dart';
import 'package:honkai_assistance/presentation/widgets/loading.dart';
import 'package:honkai_assistance/presentation/widgets/title_line.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../common/style/style.dart';

class NewsUpdate extends StatelessWidget {
  const NewsUpdate({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleLine(title: "News Update"),
        SizedBox(height: 16.h),
        _listUpdate(),
      ],
    );
  }

  Widget _listUpdate() {
    return BlocBuilder<NewsUpdateBloc, NewsUpdateState>(
      builder: (context, state) {
        if (state is LoadedNewsUpdateState) {
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount:
                state.newsUpdates.length <= 3 ? state.newsUpdates.length : 3,
            separatorBuilder: (context, index) => const SizedBox(height: 32),
            itemBuilder: (context, index) {
              final data = state.newsUpdates[index];

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => _launchUrl(data.urlWeb),
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

  void _launchUrl(String url) async {
    try {
      await launchUrl(
        Uri.parse(url),
      );
    } catch (_) {
      throw "couldn't launch this url";
    }
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

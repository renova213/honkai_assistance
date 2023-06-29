import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/domain/entities/guide_entity.dart';
import 'package:honkai_assistance/presentation/components/title_line.dart';

import '../../../common/style/style.dart';
import '../../components/loading.dart';

class DetailGuideScreen extends StatelessWidget {
  final GuideEntity guide;
  const DetailGuideScreen({super.key, required this.guide});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(guide.titleGuide, style: AppFont.headline6),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 24, top: 24).r,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Text(guide.descriptionGuide,
                  style: AppFont.largeText, textAlign: TextAlign.justify),
              SizedBox(height: 24.h),
              _listGuideItem(),
            ],
          ),
        ),
      ),
    );
  }

  ListView _listGuideItem() {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final data = guide.guideItems![index];
          return Column(
            children: [
              TitleLine(title: data.title!, height: 40, fontSize: 16),
              SizedBox(height: 16.h),
              _listGuideItemDetail(data.guideDetails!),
            ],
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 16.h),
        itemCount: guide.guideItems!.length);
  }

  ListView _listGuideItemDetail(List<GuideItemDetailEntity> guideDetail) {
    return ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final data = guideDetail[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              data.subtitle!.isEmpty
                  ? const SizedBox()
                  : Text(data.subtitle!, style: AppFont.boldMediumText),
              data.subtitle!.isEmpty
                  ? const SizedBox()
                  : SizedBox(height: 12.h),
              data.image!.isEmpty
                  ? const SizedBox()
                  : Container(
                      width: double.maxFinite,
                      height: 200.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColor.blue, width: 3),
                      ),
                      child: CachedNetworkImage(
                          imageUrl: data.image!,
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
              data.image!.isEmpty ? const SizedBox() : SizedBox(height: 8.h),
              Text(data.description,
                  style: AppFont.smallText, textAlign: TextAlign.justify)
            ],
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 16.h),
        itemCount: guideDetail.length);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:honkai_assistance/common/util/navigator_fade_helper.dart';
import 'package:honkai_assistance/presentation/components/title_line.dart';
import 'package:provider/provider.dart';

import '../../../../common/style/style.dart';
import '../../../provider/about_game_provider.dart';
import '../../web_view_screen.dart';

class OfficialLinks extends StatelessWidget {
  const OfficialLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleLine(title: "Official Links", fontSize: 16, height: 40),
        SizedBox(height: 24.h),
        _listMenu(),
        SizedBox(height: 12.h),
        _listLinkOfficialServer(),
      ],
    );
  }

  Widget _listMenu() {
    return Consumer<AboutGameProvider>(
      builder: (context, notifier, _) => Row(
        children: [
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () => notifier.changeIndexHeader(0),
              child: Container(
                height: 45.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: notifier.indexHeader == 0
                        ? const BorderSide(color: AppColor.red, width: 3)
                        : const BorderSide(color: AppColor.lineColor, width: 1),
                  ),
                ),
                child: Text("SEA",
                    style: notifier.indexHeader == 0
                        ? AppFont.subtitle
                        : AppFont.largeText),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () => notifier.changeIndexHeader(1),
              child: Container(
                height: 45.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: notifier.indexHeader == 1
                        ? const BorderSide(color: AppColor.red, width: 3)
                        : const BorderSide(color: AppColor.lineColor, width: 1),
                  ),
                ),
                child: Text("Global",
                    style: notifier.indexHeader == 1
                        ? AppFont.subtitle
                        : AppFont.largeText),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _listLinkOfficialServer() {
    return Consumer<AboutGameProvider>(
      builder: (context, about, _) => Consumer<AboutGameProvider>(
        builder: (context, notifier, _) => ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: about.indexHeader == 0
              ? notifier.officialLinksSea.length
              : notifier.officialLinksGlobal.length,
          itemBuilder: (context, index) {
            final data = about.indexHeader == 0
                ? notifier.officialLinksSea[index]
                : notifier.officialLinksGlobal[index];

            return _officialLinkItems(
                assetIcon: data["assetIcon"],
                platform: data["platform"],
                url: data["url"],
                context: context);
          },
        ),
      ),
    );
  }

  Widget _officialLinkItems(
      {required String assetIcon,
      required String platform,
      required String url,
      required BuildContext context}) {
    return SizedBox(
      height: 30.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                assetIcon,
                width: 20.w,
                height: 20.h,
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
              const SizedBox(width: 8),
              Text(platform, style: AppFont.smallText),
            ],
          ),
          Row(
            children: [
              Icon(Icons.open_in_browser, color: Colors.blue, size: 20.r),
              SizedBox(width: 8.h),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    NavigatorFadeHelper(
                      child: WebViewScreen(urlWeb: url),
                    ),
                  );
                },
                child: Text(
                  "Open in Browser",
                  style: AppFont.smallText.copyWith(color: Colors.blue),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

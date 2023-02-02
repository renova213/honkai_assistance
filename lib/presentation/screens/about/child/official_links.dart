import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:honkai_assistance/presentation/providers/about_game_provider.dart';
import 'package:honkai_assistance/presentation/widgets/title_line.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../common/style/style.dart';

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
      builder: (context, notifier, _) => ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: notifier.indexHeader == 0
            ? notifier.officialLinksSea.length
            : notifier.officialLinksGlobal.length,
        itemBuilder: (context, index) {
          final data = notifier.indexHeader == 0
              ? notifier.officialLinksSea[index]
              : notifier.officialLinksGlobal[index];

          return _officialLinkItems(
              assetIcon: data.assetIcon,
              platform: data.platform,
              url: data.url);
        },
      ),
    );
  }

  Widget _officialLinkItems(
      {required String assetIcon,
      required String platform,
      required String url}) {
    return SizedBox(
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(assetIcon,
                  width: 20, height: 20, color: Colors.white),
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
                  _launchUrl(url);
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

  void _launchUrl(String url) async {
    try {
      await launchUrl(
        Uri.parse(url),
      );
    } catch (_) {
      throw "couldn't launch this url";
    }
  }
}

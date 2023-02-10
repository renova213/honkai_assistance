import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../common/style/style.dart';
import '../provider/local/glossary_provider.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        Provider.of<GlossaryProvider>(context, listen: false).getGameModes();
        Provider.of<GlossaryProvider>(context, listen: false)
            .getGlossaryRanks();
        Provider.of<GlossaryProvider>(context, listen: false)
            .getGlossarySpecialities();
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
              _glossary(context: context);
            },
            child: Row(
              children: [
                const Icon(Icons.help, color: AppColor.red),
                SizedBox(width: 8.w),
                Text("Help",
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
                            Text("Glossary", style: AppFont.subtitle),
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
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          Text("Modes", style: AppFont.subtitle),
                          const SizedBox(height: 8),
                          Text(
                              "Each character gets a rating based on how good it is in certain game mode. Below you will find a short description of all game modes available in game",
                              style: AppFont.smallText),
                          const SizedBox(height: 16),
                          _table(
                              title: "Mode",
                              description: "Description",
                              height: 60.h,
                              indexColor: 0),
                          _gamModeTable(),
                          SizedBox(height: 16.h),
                          _table(
                              title: "Rating",
                              description: "Description",
                              indexColor: 0,
                              height: 60.h),
                          _rankTable(),
                          SizedBox(height: 16.h),
                          _table(
                              title: "Speciality",
                              description: "Description",
                              indexColor: 0,
                              height: 60.h),
                          _specialityTable(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Consumer _gamModeTable() {
    return Consumer<GlossaryProvider>(
      builder: (context, notifier, _) => ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: notifier.gameModes.length,
        itemBuilder: (context, index) {
          int indexColor = 1;

          final data = notifier.gameModes[index];

          if (index.isEven) indexColor = 1;
          if (index.isOdd) indexColor = 2;

          return _table(
              title: data.title,
              description: data.descirption,
              indexColor: indexColor);
        },
      ),
    );
  }

  Consumer _rankTable() {
    return Consumer<GlossaryProvider>(
      builder: (context, notifier, _) => ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: notifier.glossaryRanks.length,
        itemBuilder: (context, index) {
          int indexColor = 1;

          if (index.isEven) indexColor = 1;
          if (index.isOdd) indexColor = 2;

          final data = notifier.glossaryRanks[index];

          return _table(
              title: data.title,
              description: data.descirption,
              indexColor: indexColor);
        },
      ),
    );
  }

  Consumer _specialityTable() {
    return Consumer<GlossaryProvider>(
      builder: (context, notifier, _) => ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: notifier.glossarySpecialities.length,
        itemBuilder: (context, index) {
          int indexColor = 1;

          if (index.isEven) indexColor = 1;
          if (index.isOdd) indexColor = 2;

          final data = notifier.glossarySpecialities[index];

          return _table(
              title: data.title,
              description: data.descirption,
              indexColor: indexColor);
        },
      ),
    );
  }

  Widget _table(
      {double? height,
      required String title,
      required String description,
      required int indexColor}) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: indexColor == 0
            ? Colors.grey.shade700
            : indexColor == 1
                ? Colors.grey.shade800
                : Colors.transparent,
        border: Border.all(color: Colors.grey.shade700),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  title,
                  style:
                      AppFont.smallText.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: Colors.grey.shade700, width: 2),
                ),
              ),
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 8, top: 12, right: 8, bottom: 8)
                        .r,
                child: Text(
                  description,
                  style: indexColor == 0
                      ? AppFont.smallText.copyWith(fontWeight: FontWeight.bold)
                      : AppFont.smallText,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

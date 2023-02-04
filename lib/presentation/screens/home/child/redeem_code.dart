import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/common/util/utils.dart';
import 'package:honkai_assistance/presentation/provider/firestore/redeem_code_provider.dart';
import 'package:honkai_assistance/presentation/components/loading.dart';
import 'package:provider/provider.dart';

import '../../../../common/style/style.dart';
import '../../../../domain/entities/redeem_code_entity.dart';
import '../../../provider/button/redeem_code_button_provider.dart';

class RedeemCode extends StatelessWidget {
  const RedeemCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<RedeemCodeProvider>(
      builder: (context, redeemCode, _) {
        if (redeemCode.appState == AppState.loaded) {
          return Column(
            children: [
              _allServer(),
              Consumer<RedeemCodeButtonProvider>(
                builder: (context, redeemCodeButton, _) => _listRedeemCode(
                    redeemCodeButton.indexServer == 0
                        ? redeemCode.redeemCodesSea
                        : redeemCode.redeemCodesGlobal),
              ),
            ],
          );
        }
        return _loading();
      },
    );
  }

  Consumer _allServer() {
    return Consumer<RedeemCodeButtonProvider>(
      builder: (context, redeemCodeButton, _) => Row(
        children: [
          Container(
            alignment: Alignment.center,
            height: 40.h,
            decoration: const BoxDecoration(
              color: Colors.transparent,
              border: Border(
                bottom: BorderSide(color: Colors.blue, width: 3),
              ),
            ),
            child: Text("Redeem Codes", style: AppFont.subtitle),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () => redeemCodeButton.changeIndexServer(0),
              child: Container(
                alignment: Alignment.center,
                height: 40.h,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border(
                    bottom: redeemCodeButton.indexServer == 0
                        ? const BorderSide(color: AppColor.red, width: 3)
                        : const BorderSide(color: AppColor.lineColor, width: 1),
                  ),
                ),
                child: Text("SEA",
                    style: redeemCodeButton.indexServer == 0
                        ? AppFont.subtitle
                        : AppFont.largeText),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () => redeemCodeButton.changeIndexServer(1),
              child: Container(
                alignment: Alignment.center,
                height: 40.h,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border(
                    bottom: redeemCodeButton.indexServer == 1
                        ? const BorderSide(color: AppColor.red, width: 3)
                        : const BorderSide(color: AppColor.lineColor, width: 1),
                  ),
                ),
                child: Text("Global",
                    style: redeemCodeButton.indexServer == 1
                        ? AppFont.subtitle
                        : AppFont.largeText),
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _listRedeemCode(List<RedeemCodeEntity> redeemCodes) {
    return SizedBox(
      height: 110.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: redeemCodes.length,
        itemBuilder: (context, index) {
          final data = redeemCodes[index];
          return Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColor.blue, width: 3),
                ),
              ),
              width: 320.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(data.code, style: AppFont.subtitle),
                  SizedBox(height: 8.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(data.reward,
                        maxLines: 1,
                        style: AppFont.smallText
                            .copyWith(fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("${index + 1}/${redeemCodes.length}",
                          style: AppFont.mediumText
                              .copyWith(fontWeight: FontWeight.bold)),
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

  Widget _loading() {
    return Column(
      children: [
        _allServer(),
        SizedBox(height: 24.h),
        const Loading(width: 120, height: 20, borderRadius: 0),
        SizedBox(height: 20.h),
        const Loading(width: 150, height: 15, borderRadius: 0),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [Text("0/0", style: AppFont.mediumText)],
        ),
        const Divider(thickness: 3, color: AppColor.blue)
      ],
    );
  }
}

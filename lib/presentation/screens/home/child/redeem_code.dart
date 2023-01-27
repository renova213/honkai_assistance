import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/presentation/providers/redeem_code_provider.dart';
import 'package:provider/provider.dart';

import '../../../../common/style/style.dart';
import '../../../../domain/entities/redeem_code_entity.dart';
import '../../../blocs/redeem_code/redeem_code_bloc.dart';

class RedeemCode extends StatelessWidget {
  const RedeemCode({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RedeemCodeBloc, RedeemCodeState>(
      builder: (context, state) {
        if (state is LoadedRedeemCode) {
          return Column(
            children: [
              _allServer(),
              Consumer<RedeemCodeProvider>(
                builder: (context, notifier, _) => _listRedeemCode(
                    notifier.indexServer == 0
                        ? state.redeemCodesSea
                        : state.redeemCodesGlobal),
              ),
            ],
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }

  Consumer _allServer() {
    return Consumer<RedeemCodeProvider>(
      builder: (context, notifier, _) => Row(
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
              onTap: () => notifier.changeIndexServer(0),
              child: Container(
                alignment: Alignment.center,
                height: 40.h,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border(
                    bottom: notifier.indexServer == 0
                        ? const BorderSide(color: AppColor.red, width: 3)
                        : const BorderSide(color: AppColor.lineColor, width: 1),
                  ),
                ),
                child: Text("SEA",
                    style: notifier.indexServer == 0
                        ? AppFont.subtitle
                        : AppFont.largeText1),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () => notifier.changeIndexServer(1),
              child: Container(
                alignment: Alignment.center,
                height: 40.h,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border(
                    bottom: notifier.indexServer == 1
                        ? const BorderSide(color: AppColor.red, width: 3)
                        : const BorderSide(color: AppColor.lineColor, width: 1),
                  ),
                ),
                child: Text("Global",
                    style: notifier.indexServer == 1
                        ? AppFont.subtitle
                        : AppFont.largeText1),
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
          }),
    );
  }
}

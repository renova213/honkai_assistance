import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/common/style/style.dart';
import 'package:honkai_assistance/presentation/provider/top_up_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PaymentMethodTopUp extends StatelessWidget {
  const PaymentMethodTopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        padding:
            const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black),
                  child: Center(child: Text("3", style: AppFont.subtitle)),
                ),
                SizedBox(width: 12.w),
                Text(
                  "Metode Pembayaran",
                  style: AppFont.subtitle.copyWith(color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            _listPayment(),
          ],
        ),
      ),
    );
  }

  Consumer _listPayment() {
    return Consumer<TopUpProvider>(
      builder: (context, topup, _) => ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final data = topup.bankPayments[index];

            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    if (topup.selectedPrice == 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            duration: Duration(seconds: 1),
                            content: Text("Pilih item terlebih dahulu")),
                      );
                    } else {
                      topup.changePaymentMethodIndex(index, data.paymentFee);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 16),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.black.withOpacity(0.5)),
                        color: topup.paymentMethodIndex == index
                            ? Colors.orangeAccent
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Image.asset(data.bankAssetImage,
                            height: 25, fit: BoxFit.fill),
                        SizedBox(width: 8.w),
                        Text(data.bankName,
                            style: AppFont.mediumText
                                .copyWith(color: Colors.black)),
                        const Spacer(),
                        Text(
                            "Rp ${NumberFormat('#,##0').format(topup.selectedPrice == 0 ? 0 : data.paymentFee + topup.selectedPrice)}",
                            style: AppFont.mediumText
                                .copyWith(color: Colors.black)),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(height: 12.h),
          itemCount: topup.bankPayments.length),
    );
  }
}

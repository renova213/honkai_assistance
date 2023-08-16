import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/common/style/style.dart';
import 'package:honkai_assistance/presentation/provider/top_up_checkout_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DetailTopUpInfo extends StatelessWidget {
  const DetailTopUpInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF6C757D)),
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFF343A40)),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, bottom: 24, top: 32),
          child: _orderDetail(),
        ),
      ),
    );
  }

  Consumer _orderDetail() {
    return Consumer<TopUpCheckoutProvider>(
      builder: (context, topUpCheckout, _) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Order Details", style: AppFont.subtitle),
          SizedBox(height: 24.h),
          _orderDetailItem(
              "Invoice ID",
              Text(topUpCheckout.topUpCheckout!.invoiceId,
                  style: AppFont.mediumText)),
          SizedBox(height: 8.h),
          _orderDetailItem(
            "Status",
            Container(
              height: 35,
              width: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: topUpCheckout.topUpCheckout!.status == 0
                      ? const Color(0xFFffc107)
                      : topUpCheckout.topUpCheckout!.status == 1
                          ? Colors.green
                          : topUpCheckout.topUpCheckout!.status == 2
                              ? Colors.blue
                              : Colors.red),
              child: Text(
                  topUpCheckout.topUpCheckout!.status == 0
                      ? "Unpaid"
                      : topUpCheckout.topUpCheckout!.status == 1
                          ? "Paid"
                          : topUpCheckout.topUpCheckout!.status == 2
                              ? "Done"
                              : "Cancel",
                  style: AppFont.mediumText),
            ),
          ),
          SizedBox(height: 8.h),
          _orderDetailItem(
              "Product",
              Text(topUpCheckout.topUpCheckout!.topUpItem.itemName,
                  style: AppFont.mediumText)),
          SizedBox(height: 8.h),
          _orderDetailItem(
              "Payment Method",
              Text(topUpCheckout.topUpCheckout!.paymentMethod.bankName,
                  style: AppFont.mediumText)),
          SizedBox(height: 8.h),
          _orderDetailItem(
              "Bank Account Number",
              Text(
                  topUpCheckout.topUpCheckout!.paymentMethod.accountNumber
                      .toString(),
                  style: AppFont.mediumText)),
          SizedBox(height: 8.h),
          _orderDetailItem(
              "Price",
              Text(
                  "Rp ${NumberFormat('#,##0').format(topUpCheckout.topUpCheckout!.topUpItem.price)}",
                  style: AppFont.mediumText)),
          SizedBox(height: 8.h),
          _orderDetailItem(
              "Payment Fee",
              Text(
                  "Rp ${NumberFormat('#,##0').format(topUpCheckout.topUpCheckout!.paymentMethod.paymentFee)}",
                  style: AppFont.mediumText)),
          SizedBox(height: 16.h),
          const Divider(color: Color(0xFF6C757D)),
          SizedBox(height: 8.h),
          Text(
              "Please enter the same amount as the total price or the order will be rejected",
              style: AppFont.mediumText),
          SizedBox(height: 8.h),
          const Divider(color: Color(0xFF6C757D)),
          SizedBox(height: 16.h),
          _orderDetailItem(
            "Total",
            Text(
                "Rp ${NumberFormat('#,##0').format(topUpCheckout.topUpCheckout!.total)}",
                style:
                    AppFont.subtitle.copyWith(color: const Color(0xFFBF7E15))),
          ),
        ],
      ),
    );
  }

  Row _orderDetailItem(String text, Widget widget) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(text, style: AppFont.mediumText), widget],
    );
  }
}

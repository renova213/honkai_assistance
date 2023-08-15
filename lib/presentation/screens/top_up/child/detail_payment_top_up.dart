import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/common/style/style.dart';
import 'package:honkai_assistance/presentation/provider/top_up_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DetailPaymentTopUp extends StatelessWidget {
  const DetailPaymentTopUp({super.key});

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
        child: Consumer<TopUpProvider>(
          builder: (context, topup, _) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black),
                    child: Center(child: Text("4", style: AppFont.subtitle)),
                  ),
                  SizedBox(width: 12.w),
                  Text(
                    "Detail Pembayaran",
                    style: AppFont.subtitle.copyWith(color: Colors.black),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              _detailItem("Harga",
                  topup.paymentMethodIndex > 100 ? 0 : topup.selectedPrice),
              SizedBox(height: 6.h),
              _detailItem("Payment Fee",
                  topup.paymentMethodIndex > 100 ? 0 : topup.paymentFee),
              SizedBox(height: 6.h),
              _detailItem(
                  "Total",
                  topup.paymentMethodIndex > 100
                      ? 0
                      : topup.selectedPrice + topup.paymentFee),
              SizedBox(height: 32.h),
              _checkoutButton(),
            ],
          ),
        ),
      ),
    );
  }

  Row _detailItem(String label, int price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: AppFont.mediumText.copyWith(color: Colors.black)),
        Text("Rp ${NumberFormat('#,##0').format(price)}",
            style: AppFont.mediumText.copyWith(color: Colors.black)),
      ],
    );
  }

  SizedBox _checkoutButton() {
    return SizedBox(
      height: 55,
      width: double.maxFinite,
      child: Consumer<TopUpProvider>(
        builder: (context, topup, _) => ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                const MaterialStatePropertyAll<Color>(Colors.deepOrangeAccent),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10), // Adjust the radius as needed
              ),
            ),
          ),
          onPressed: () {
            if (topup.userId == 0) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Masukkan user id")));
            } else if (topup.selectedPrice == 0) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Pilih item terlebih dahulu")));
            } else if (topup.paymentFee == 0) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Pilih metode pembayaran")));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Pembelian Berhasil")));
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.shopping_cart, color: Colors.white),
              SizedBox(width: 8.w),
              Text("Order Sekarang", style: AppFont.boldMediumText)
            ],
          ),
        ),
      ),
    );
  }
}

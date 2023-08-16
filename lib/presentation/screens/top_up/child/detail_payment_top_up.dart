import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/common/style/style.dart';
import 'package:honkai_assistance/domain/entities/payment_entity.dart';
import 'package:honkai_assistance/domain/entities/top_up_entity.dart';
import 'package:honkai_assistance/domain/entities/topup_checkout_entity.dart';
import 'package:honkai_assistance/presentation/provider/auth_provider.dart';
import 'package:honkai_assistance/presentation/provider/navbar_provider.dart';
import 'package:honkai_assistance/presentation/provider/top_up_checkout_provider.dart';
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
                    "Detail Payment",
                    style: AppFont.subtitle.copyWith(color: Colors.black),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              _detailItem(
                  "Harga",
                  topup.paymentMethodIndex > 100
                      ? 0
                      : topup.selectedItem.price),
              SizedBox(height: 6.h),
              _detailItem(
                  "Payment Fee",
                  topup.paymentMethodIndex > 100
                      ? 0
                      : topup.paymentMethod.paymentFee),
              SizedBox(height: 6.h),
              _detailItem(
                  "Total",
                  topup.paymentMethodIndex > 100
                      ? 0
                      : topup.selectedItem.price +
                          topup.paymentMethod.paymentFee),
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
        builder: (context, topup, _) => Consumer<TopUpCheckoutProvider>(
          builder: (context, topUpCheckout, _) => Consumer<AuthProvider>(
            builder: (context, auth, _) => Consumer<NavbarProvider>(
              builder: (context, navBar, _) => ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll<Color>(
                      Colors.deepOrangeAccent),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10), // Adjust the radius as needed
                    ),
                  ),
                ),
                onPressed: () async {
                  final date =
                      DateFormat('dd MMMM yyyy').format(DateTime.now());
                  final expiredAt = DateFormat('dd MMMM yyyy hh:mm:ss a')
                      .format(DateTime.now().add(const Duration(days: 1)));

                  if (topup.userId == 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("enter user id")));
                  } else if (topup.selectedItem.price == 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Select item first")));
                  } else if (topup.paymentMethod.paymentFee == 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Select payment method")));
                  } else {
                    try {
                      String invoiceId = "INV-${generateRandomNumber()}";
                      await topUpCheckout
                          .createTopUpCheckout(
                              topUpCheckout: TopUpCheckoutEntity(
                                id: "",
                                invoiceId: invoiceId,
                                userEmail: auth.emailUser,
                                topUpItem: topup.selectedItem,
                                date: date,
                                userId: topup.userId,
                                status: 0,
                                paymentMethod: topup.paymentMethod,
                                quantity: 1,
                                transferUrlImage: "",
                                total: topup.selectedItem.price +
                                    topup.paymentMethod.paymentFee,
                                createdAt: DateTime.now().toString(),
                                expiredAt: expiredAt,
                              ),
                              userEmail: auth.emailUser)
                          .then((_) {
                        topup.changeCategoryIndex(999);
                        topup.changeUserId(0);
                        topup.changeItemIndex(
                            999,
                            const TopUpItemEntity(
                                itemName: "", imageAsset: "", price: 0));
                        topup.changePaymentMethodIndex(
                            999,
                            const PaymentEntity(
                                bankName: "",
                                accountNumber: 0,
                                bankAssetImage: "",
                                paymentFee: 0));
                      }).then(
                        (_) => navBar.changeTopUpIndex(1),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(e.toString())),
                      );
                    }
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
          ),
        ),
      ),
    );
  }

  String generateRandomNumber() {
    Random random = Random();
    int randomNumber = random.nextInt(100000000); // 10-digit number
    return randomNumber.toString().padLeft(10, '0'); // Ensure 10-digit format
  }
}

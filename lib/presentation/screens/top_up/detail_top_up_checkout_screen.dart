import 'package:flutter/material.dart';
import 'package:honkai_assistance/common/style/font_style.dart';
import 'package:honkai_assistance/domain/entities/topup_checkout_entity.dart';

class DetailTopUpCheckoutScreen extends StatelessWidget {
  final TopUpCheckoutEntity topUpCheckout;
  const DetailTopUpCheckoutScreen({super.key, required this.topUpCheckout});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Detail Topup Checkout", style: AppFont.subtitle),
      ),
    );
  }
}

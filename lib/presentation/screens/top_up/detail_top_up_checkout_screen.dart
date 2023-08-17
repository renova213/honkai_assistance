import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/presentation/provider/top_up_checkout_provider.dart';
import 'package:honkai_assistance/presentation/screens/top_up/child/top_up_childs.dart';
import 'package:provider/provider.dart';

class DetailTopUpCheckoutScreen extends StatefulWidget {
  final String invoiceId;
  const DetailTopUpCheckoutScreen({super.key, required this.invoiceId});

  @override
  State<DetailTopUpCheckoutScreen> createState() =>
      _DetailTopUpCheckoutScreenState();
}

class _DetailTopUpCheckoutScreenState extends State<DetailTopUpCheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TopUpCheckoutProvider>(
        builder: (context, topUpCheckout, _) => ListView(
          children: [
            const AppBarDetailTopUp(),
            SizedBox(height: 4.h),
            const DetailTopUpInfo(),
            SizedBox(height: 32.h),
            topUpCheckout.topUpCheckout!.status == 3
                ? const SizedBox()
                : DetailTopUpButton(invoiceId: widget.invoiceId),
            topUpCheckout.topUpCheckout!.status == 3
                ? const SizedBox()
                : SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }
}

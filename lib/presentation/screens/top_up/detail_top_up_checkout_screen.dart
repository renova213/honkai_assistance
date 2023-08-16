import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/presentation/screens/top_up/child/top_up_childs.dart';

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
      body: ListView(
        children: [
          const AppBarDetailTopUp(),
          SizedBox(height: 4.h),
          const DetailTopUpInfo(),
          SizedBox(height: 32.h),
          DetailTopUpButton(invoiceId: widget.invoiceId),
          SizedBox(height: 32.h),
        ],
      ),
    );
  }
}

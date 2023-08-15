import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/common/style/font_style.dart';
import 'package:honkai_assistance/presentation/provider/top_up_provider.dart';
import 'package:honkai_assistance/presentation/screens/top_up/child/top_up_childs.dart';
import 'package:provider/provider.dart';

class MenuTopUpScreen extends StatefulWidget {
  const MenuTopUpScreen({super.key});

  @override
  State<MenuTopUpScreen> createState() => _MenuTopUpScreenState();
}

class _MenuTopUpScreenState extends State<MenuTopUpScreen> {
  final TextEditingController purchaseAmountController =
      TextEditingController();

  final TextEditingController userIdController = TextEditingController();

  @override
  void dispose() {
    purchaseAmountController.dispose();
    userIdController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      Provider.of<TopUpProvider>(context, listen: false).changeCategoryIndex(0);
      Provider.of<TopUpProvider>(context, listen: false)
          .changeItemIndex(999, 0);
      Provider.of<TopUpProvider>(context, listen: false)
          .changePaymentMethodIndex(999, 0);

      Future.microtask(() =>
          Provider.of<TopUpProvider>(context, listen: false).changeUserId(0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const AppBarTopUp(),
          _description(),
          SizedBox(height: 24.h),
          UserIdTopUp(userIdController: userIdController),
          SizedBox(height: 16.h),
          const CategoryTopUp(),
          SizedBox(height: 16.h),
          const PaymentMethodTopUp(),
          SizedBox(height: 16.h),
          const DetailPaymentTopUp(),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }

  Padding _description() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Honkai Impact 3", style: AppFont.headline5),
          SizedBox(height: 16.h),
          Text(
              "Untuk menemukan User ID Anda, buka aplikasi Honkai Impact 3, klik pada informasi level yang terletak di kiri atas layar, temukan User ID Anda disana. Silakan masukan User ID Anda disini.",
              style: AppFont.mediumText
                  .copyWith(color: Colors.white.withOpacity(0.8)),
              textAlign: TextAlign.justify),
        ],
      ),
    );
  }
}

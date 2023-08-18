import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/common/style/font_style.dart';
import 'package:honkai_assistance/common/util/navigator_fade_helper.dart';
import 'package:honkai_assistance/domain/entities/topup_checkout_entity.dart';
import 'package:honkai_assistance/presentation/provider/auth_provider.dart';
import 'package:honkai_assistance/presentation/provider/top_up_checkout_provider.dart';
import 'package:honkai_assistance/presentation/screens/top_up/detail_top_up_checkout_screen.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      final String emailUser =
          Provider.of<AuthProvider>(context, listen: false).emailUser;

      await Provider.of<TopUpCheckoutProvider>(context, listen: false)
          .getTopUpCheckouts(emailUser)
          .then((_) async =>
              await Provider.of<TopUpCheckoutProvider>(context, listen: false)
                  .changeFilterState(0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            _listFilter(),
            SizedBox(height: 24.h),
            _listOrder(),
          ],
        ),
      ),
    );
  }

  SizedBox _listFilter() {
    List<String> filters = ["All", "Pending", "Process", "Done", "Cancel"];

    return SizedBox(
      height: 55,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final data = filters[index];
            return ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Material(
                color: Colors.transparent,
                child: Consumer<TopUpCheckoutProvider>(
                  builder: (context, topUpChekcout, _) => InkWell(
                    onTap: () {
                      topUpChekcout.changeFilterState(index);
                    },
                    child: Ink(
                      height: 50.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: topUpChekcout.filterIndex == index
                              ? const Color(0xFF6C757D)
                              : const Color(0xFF343A40)),
                      child: Center(
                          child: Text(data,
                              style: AppFont.mediumText.copyWith(
                                  color: topUpChekcout.filterIndex == index
                                      ? Colors.white
                                      : Colors.white.withOpacity(0.7)))),
                    ),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(width: 8.w),
          itemCount: filters.length),
    );
  }

  Consumer _listOrder() {
    return Consumer<TopUpCheckoutProvider>(
        builder: (context, topUpCheckout, _) => Consumer<AuthProvider>(
              builder: (context, auth, _) => topUpCheckout
                      .filterTopUpCheckouts.isEmpty
                  ? Center(
                      child: Text("Order history is empty",
                          style: AppFont.subtitle),
                    )
                  : ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final data = topUpCheckout.filterTopUpCheckouts[index];
                        String temporaryCurrentDateTime =
                            DateFormat('dd MMMM yyyy HH:mm:ss')
                                .format(DateTime.now());

                        final DateTime currentDateTime =
                            DateFormat('dd MMMM yyyy HH:mm:ss')
                                .parse(temporaryCurrentDateTime);

                        if (currentDateTime.isAfter(data.expiredAtFormat) &&
                            data.status != 3) {
                          topUpCheckout.updateTopUpCheckout(
                              topUpCheckout: TopUpCheckoutEntity(
                                  id: data.id,
                                  userEmail: data.userEmail,
                                  invoiceId: data.invoiceId,
                                  topUpItem: data.topUpItem,
                                  date: data.date,
                                  userId: data.userId,
                                  status: 3,
                                  paymentMethod: data.paymentMethod,
                                  createdAt: data.createdAt,
                                  expiredAt: data.expiredAt,
                                  transferUrlImage: data.transferUrlImage,
                                  total: data.total),
                              userEmail: auth.emailUser,
                              id: data.id);
                        }

                        return InkWell(
                          onTap: () async {
                            await topUpCheckout
                                .getTopUpCheckoutsByInvoiceId(
                                    auth.emailUser, data.invoiceId)
                                .then(
                              (_) {
                                if (topUpCheckout.topUpCheckout != null) {
                                  Navigator.of(context).push(
                                    NavigatorFadeHelper(
                                        child: DetailTopUpCheckoutScreen(
                                            invoiceId: data.invoiceId)),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "Invoice ID not found, please message cs for further information")),
                                  );
                                }
                              },
                            );
                          },
                          child: Ink(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xFF6C757D)),
                                borderRadius: BorderRadius.circular(5),
                                color: const Color(0xFF343A40)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                          "assets/images/honkai.jpg",
                                          width: 55.w,
                                          height: 55.w,
                                          fit: BoxFit.fill),
                                    ),
                                    SizedBox(width: 12.w),
                                    Text("Honkai Impact 3",
                                        style: AppFont.subtitle),
                                  ],
                                ),
                                SizedBox(height: 16.h),
                                _orderDetailItem(
                                  "Status",
                                  Container(
                                    height: 35,
                                    width: 100,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: data.status == 0
                                            ? const Color(0xFFf2e0bf)
                                            : data.status == 1
                                                ? Colors.green
                                                : data.status == 2
                                                    ? Colors.blue
                                                    : Colors.red),
                                    child: Text(
                                        data.status == 0
                                            ? "Pending"
                                            : data.status == 1
                                                ? "Process"
                                                : data.status == 2
                                                    ? "Done"
                                                    : "Cancel",
                                        style: AppFont.mediumText.copyWith(
                                            color: data.status == 0
                                                ? Colors.brown
                                                : Colors.white)),
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                _orderDetailItem(
                                    "Invoice ID",
                                    Text(data.invoiceId,
                                        style: AppFont.mediumText)),
                                SizedBox(height: 8.h),
                                _orderDetailItem(
                                    "Product",
                                    Text(data.topUpItem.itemName,
                                        style: AppFont.mediumText)),
                                SizedBox(height: 8.h),
                                _orderDetailItem("Payment Date",
                                    Text(data.date, style: AppFont.mediumText)),
                                SizedBox(height: 8.h),
                                _orderDetailItem(
                                    "Payment Method",
                                    Text(data.paymentMethod.bankName,
                                        style: AppFont.mediumText)),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 12.h),
                      itemCount: topUpCheckout.filterTopUpCheckouts.length),
            ));
  }

  Row _orderDetailItem(String text, Widget widget) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(text, style: AppFont.mediumText), widget],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/common/util/navigator_fade_helper.dart';
import 'package:honkai_assistance/presentation/provider/auth_provider.dart';
import 'package:honkai_assistance/presentation/provider/navbar_provider.dart';
import 'package:honkai_assistance/presentation/provider/top_up_checkout_provider.dart';
import 'package:honkai_assistance/presentation/screens/top_up/detail_top_up_checkout_screen.dart';
import 'package:provider/provider.dart';

import '../../../../common/style/style.dart';

class DetailTopUpButton extends StatelessWidget {
  final String invoiceId;
  const DetailTopUpButton({super.key, required this.invoiceId});

  @override
  Widget build(BuildContext context) {
    return Consumer<TopUpCheckoutProvider>(
      builder: (context, topUpCheckout, _) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            topUpCheckout.topUpCheckout!.status == 0
                ? _uploadPaymentButton()
                : _buyAgainButton(),
            SizedBox(height: 16.h),
            SizedBox(
              width: double.maxFinite,
              height: 50,
              child: Consumer<AuthProvider>(
                builder: (context, auth, _) => OutlinedButton(
                  style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll<Color>(
                          Colors.transparent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      side: const MaterialStatePropertyAll<BorderSide>(
                          BorderSide(color: Color(0xFFD18002)))),
                  onPressed: () async {
                    await topUpCheckout
                        .getTopUpCheckoutsByInvoiceId(auth.emailUser, invoiceId)
                        .then(
                      (_) {
                        if (topUpCheckout.topUpCheckout != null) {
                          Navigator.of(context).pushReplacement(
                            NavigatorFadeHelper(
                                child: DetailTopUpCheckoutScreen(
                                    invoiceId: invoiceId)),
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
                  child: Text(
                    "Check Order Status",
                    style: AppFont.mediumText
                        .copyWith(color: const Color(0xFFD18002)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Consumer _buyAgainButton() {
    return Consumer<TopUpCheckoutProvider>(
      builder: (context, topUpCheckout, _) => SizedBox(
        width: double.maxFinite,
        height: 50,
        child: Consumer<NavbarProvider>(
          builder: (context, navBar, _) => ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  const MaterialStatePropertyAll<Color>(Colors.green),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10), // Adjust the radius as needed
                ),
              ),
            ),
            onPressed: () {
              navBar.changeTopUpIndex(0);
              Navigator.pop(context);
            },
            child: Text("Buy Again", style: AppFont.mediumText),
          ),
        ),
      ),
    );
  }

  Consumer _uploadPaymentButton() {
    return Consumer<TopUpCheckoutProvider>(
      builder: (context, topUpCheckout, _) => SizedBox(
        width: double.maxFinite,
        height: 50,
        child: Consumer<NavbarProvider>(
          builder: (context, navBar, _) => ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  const MaterialStatePropertyAll<Color>(Color(0xFFD18002)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10), // Adjust the radius as needed
                ),
              ),
            ),
            onPressed: () {},
            child: Text("Upload Payment", style: AppFont.mediumText),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/common/util/navigator_fade_helper.dart';
import 'package:honkai_assistance/domain/entities/topup_checkout_entity.dart';
import 'package:honkai_assistance/presentation/provider/auth_provider.dart';
import 'package:honkai_assistance/presentation/provider/navbar_provider.dart';
import 'package:honkai_assistance/presentation/provider/storage_image_provide.dart';
import 'package:honkai_assistance/presentation/provider/top_up_checkout_provider.dart';
import 'package:honkai_assistance/presentation/screens/top_up/detail_top_up_checkout_screen.dart';
import 'package:honkai_assistance/presentation/screens/top_up/top_up_navbar.dart';
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
            onPressed: () {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => const Dialog(child: ModalUploadPayment()),
              );
            },
            child: Text("Upload Payment", style: AppFont.mediumText),
          ),
        ),
      ),
    );
  }
}

class ModalUploadPayment extends StatefulWidget {
  const ModalUploadPayment({super.key});

  @override
  State<ModalUploadPayment> createState() => _ModalUploadPaymentState();
}

class _ModalUploadPaymentState extends State<ModalUploadPayment> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<StorageImageProvider>(context, listen: false).clearImage());
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 24),
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          color: AppColor.containerColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Consumer<StorageImageProvider>(
              builder: (context, storageImage, _) => GestureDetector(
                onTap: () async {
                  await storageImage.getImage();
                },
                child: storageImage.image == null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                            "assets/images/placeholder_image.jpg",
                            fit: BoxFit.cover,
                            width: double.maxFinite,
                            height: 200.h),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(storageImage.image!,
                            fit: BoxFit.cover,
                            width: double.maxFinite,
                            height: 200.h),
                      ),
              ),
            ),
            SizedBox(height: 16.h),
            _confirmUploadPaymentButton(),
          ],
        ),
      ),
    );
  }

  Consumer _confirmUploadPaymentButton() {
    return Consumer<TopUpCheckoutProvider>(
      builder: (context, topUpCheckout, _) => Consumer<StorageImageProvider>(
        builder: (context, storageImage, _) => Consumer<AuthProvider>(
          builder: (context, auth, _) => SizedBox(
            width: double.maxFinite,
            height: 50,
            child: Consumer<NavbarProvider>(
              builder: (context, navBar, _) => ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      const MaterialStatePropertyAll<Color>(Color(0xFFD18002)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10), // Adjust the radius as needed
                    ),
                  ),
                ),
                onPressed: () async {
                  final TopUpCheckoutEntity topUpCheckoutEntity =
                      topUpCheckout.topUpCheckout!;
                  try {
                    await storageImage
                        .uploadProductImage()
                        .then((_) async =>
                            await topUpCheckout.updateTopUpCheckout(
                                topUpCheckout: TopUpCheckoutEntity(
                                    id: topUpCheckout.topUpCheckout!.id,
                                    userEmail: topUpCheckoutEntity.userEmail,
                                    invoiceId: topUpCheckoutEntity.invoiceId,
                                    topUpItem: topUpCheckoutEntity.topUpItem,
                                    date: topUpCheckoutEntity.date,
                                    userId: topUpCheckoutEntity.userId,
                                    status: 1,
                                    paymentMethod:
                                        topUpCheckoutEntity.paymentMethod,
                                    createdAt: topUpCheckoutEntity.createdAt,
                                    expiredAt: topUpCheckoutEntity.expiredAt,
                                    transferUrlImage:
                                        storageImage.urlProductImage!,
                                    total: topUpCheckoutEntity.total),
                                userEmail: auth.emailUser,
                                id: topUpCheckoutEntity.id))
                        .then((_) => navBar.changeTopUpIndex(1))
                        .then(
                          (value) => Navigator.of(context).pushReplacement(
                            NavigatorFadeHelper(child: const TopUpNavBar()),
                          ),
                        );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: const Duration(seconds: 1),
                        content: Text(e.toString()),
                      ),
                    );
                  }
                },
                child: Text("Upload Payment", style: AppFont.mediumText),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

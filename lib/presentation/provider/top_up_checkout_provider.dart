import 'package:flutter/material.dart';
import 'package:honkai_assistance/domain/entities/topup_checkout_entity.dart';
import 'package:honkai_assistance/domain/usecases/post_top_up_checkout.dart';

class TopUpCheckoutProvider extends ChangeNotifier {
  final PostTopUpCheckout postTopUpCheckout;
  TopUpCheckoutProvider({required this.postTopUpCheckout});

  Future<void> createTopUpCheckout(
      {required TopUpCheckoutEntity topUpCheckout}) async {
    try {
      await postTopUpCheckout.call(topUpCheckout);
    } catch (e) {
      rethrow;
    }
  }
}

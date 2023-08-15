import 'package:honkai_assistance/domain/entities/payment_entity.dart';

class PaymentModel extends PaymentEntity {
  const PaymentModel(
      {required super.bankName,
      required super.bankAssetImage,
      required super.paymentFee,
      required super.accountNumber});
}

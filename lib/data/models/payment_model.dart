import 'package:honkai_assistance/domain/entities/payment_entity.dart';

class PaymentModel extends PaymentEntity {
  const PaymentModel(
      {required super.bankName,
      required super.bankAssetImage,
      required super.paymentFee,
      required super.accountNumber});

  factory PaymentModel.fromMap(Map<String, dynamic> map) => PaymentModel(
        bankName: map['bankName'],
        bankAssetImage: map['bankAssetImage'],
        paymentFee: map['paymentFee'],
        accountNumber: map['accountNumber'],
      );

  Map<String, dynamic> toJson() => {
        'bankName': bankName,
        'bankAssetImage': bankAssetImage,
        'paymentFee': paymentFee,
        'accountNumber': accountNumber,
      };
}

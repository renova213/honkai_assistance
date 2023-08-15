import 'package:equatable/equatable.dart';
import 'package:honkai_assistance/data/models/payment_model.dart';

class PaymentEntity extends Equatable {
  final String bankName;
  final int accountNumber;
  final String bankAssetImage;
  final int paymentFee;

  const PaymentEntity(
      {required this.bankName,
      required this.accountNumber,
      required this.bankAssetImage,
      required this.paymentFee});

  PaymentModel toModel() => PaymentModel(
      bankName: bankName,
      bankAssetImage: bankAssetImage,
      paymentFee: paymentFee,
      accountNumber: accountNumber);

  @override
  List<Object> get props => [bankName, bankAssetImage, paymentFee];
}

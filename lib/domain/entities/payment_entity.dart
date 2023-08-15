import 'package:equatable/equatable.dart';

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

  @override
  List<Object> get props => [bankName, bankAssetImage, paymentFee];
}

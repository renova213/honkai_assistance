import 'package:equatable/equatable.dart';
import 'package:honkai_assistance/domain/entities/payment_entity.dart';
import 'package:honkai_assistance/domain/entities/top_up_entity.dart';

class TopUpCheckoutEntity extends Equatable {
  final String invoiceId;
  final int status;
  final int userId;
  final TopUpItemEntity topUpItem;
  final int quantity;
  final PaymentEntity paymentMethod;
  final int paymentFee;
  final int total;

  const TopUpCheckoutEntity(
      {required this.invoiceId,
      required this.topUpItem,
      required this.userId,
      required this.status,
      required this.paymentFee,
      required this.paymentMethod,
      required this.quantity,
      required this.total});
  @override
  List<Object> get props => [
        invoiceId,
        status,
        userId,
        topUpItem,
        quantity,
        paymentMethod,
        paymentFee,
        total
      ];
}

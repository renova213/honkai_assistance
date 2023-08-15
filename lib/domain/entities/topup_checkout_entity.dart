import 'package:equatable/equatable.dart';
import 'package:honkai_assistance/data/models/top_up_checkout_model.dart';
import 'package:honkai_assistance/domain/entities/payment_entity.dart';
import 'package:honkai_assistance/domain/entities/top_up_entity.dart';

class TopUpCheckoutEntity extends Equatable {
  final String id;
  final String userEmail;
  final String invoiceId;
  final int status;
  final int userId;
  final TopUpItemEntity topUpItem;
  final int quantity;
  final PaymentEntity paymentMethod;
  final int total;
  final String transferUrlImage;

  const TopUpCheckoutEntity(
      {required this.id,
      required this.userEmail,
      required this.invoiceId,
      required this.topUpItem,
      required this.userId,
      required this.status,
      required this.paymentMethod,
      required this.quantity,
      required this.transferUrlImage,
      required this.total});

  TopUpCheckoutModel toModel() => TopUpCheckoutModel(
      invoiceId: invoiceId,
      topUpItem: topUpItem.toModel(),
      userEmail: userEmail,
      userId: userId,
      status: status,
      paymentMethod: paymentMethod.toModel(),
      quantity: quantity,
      total: total,
      id: id,
      transferUrlImage: transferUrlImage);

  @override
  List<Object> get props => [
        invoiceId,
        status,
        userId,
        topUpItem,
        quantity,
        paymentMethod,
        userEmail,
        total,
        transferUrlImage
      ];
}

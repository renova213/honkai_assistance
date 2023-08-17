import 'package:equatable/equatable.dart';
import 'package:honkai_assistance/data/models/top_up_checkout_model.dart';
import 'package:honkai_assistance/domain/entities/payment_entity.dart';
import 'package:honkai_assistance/domain/entities/top_up_entity.dart';
import 'package:intl/intl.dart';

class TopUpCheckoutEntity extends Equatable {
  final String id;
  final String userEmail;
  final String invoiceId;
  final String date;
  final String createdAt;
  final String expiredAt;
  final int status;
  final int userId;
  final TopUpItemEntity topUpItem;
  final PaymentEntity paymentMethod;
  final int total;
  final String transferUrlImage;

  const TopUpCheckoutEntity(
      {required this.id,
      required this.userEmail,
      required this.invoiceId,
      required this.topUpItem,
      required this.date,
      required this.userId,
      required this.status,
      required this.paymentMethod,
      required this.createdAt,
      required this.expiredAt,
      required this.transferUrlImage,
      required this.total});

  TopUpCheckoutModel toModel() => TopUpCheckoutModel(
      invoiceId: invoiceId,
      topUpItem: topUpItem.toModel(),
      userEmail: userEmail,
      userId: userId,
      date: date,
      expiredAt: expiredAt,
      status: status,
      createdAt: createdAt,
      paymentMethod: paymentMethod.toModel(),
      total: total,
      id: id,
      transferUrlImage: transferUrlImage);

  @override
  List<Object> get props => [
        invoiceId,
        status,
        userId,
        topUpItem,
        createdAt,
        paymentMethod,
        userEmail,
        date,
        total,
        expiredAt,
        transferUrlImage
      ];

  DateTime get expiredAtFormat =>
      DateFormat('dd MMMM yyyy HH:mm:ss').parse(expiredAt);
  DateTime get createdAtFormat =>
      DateFormat('yyyy-MM-dd HH:mm:ss').parse(createdAt);
}

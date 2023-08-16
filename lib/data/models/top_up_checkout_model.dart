import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:honkai_assistance/data/models/payment_model.dart';
import 'package:honkai_assistance/data/models/topup_item_model.dart';
import 'package:honkai_assistance/domain/entities/topup_checkout_entity.dart';

class TopUpCheckoutModel extends TopUpCheckoutEntity {
  const TopUpCheckoutModel(
      {required super.invoiceId,
      required super.topUpItem,
      required super.createdAt,
      required super.expiredAt,
      required super.userId,
      required super.status,
      required super.paymentMethod,
      required super.date,
      required super.quantity,
      required super.total,
      required super.id,
      required super.transferUrlImage,
      required super.userEmail});

  factory TopUpCheckoutModel.fromDoc(DocumentSnapshot doc) =>
      TopUpCheckoutModel(
          invoiceId: (doc.data() as Map)['invoiceId'],
          userEmail: (doc.data() as Map)['userEmail'],
          createdAt: (doc.data() as Map)['createdAt'],
          expiredAt: (doc.data() as Map)['expiredAt'],
          date: (doc.data() as Map)['date'],
          topUpItem: TopUpItemModel.fromMap((doc.data() as Map)['topUpItem']),
          userId: (doc.data() as Map)['userId'],
          status: (doc.data() as Map)['status'],
          paymentMethod:
              PaymentModel.fromMap((doc.data() as Map)['paymentMethod']),
          quantity: (doc.data() as Map)['quantity'],
          total: (doc.data() as Map)['total'],
          transferUrlImage: (doc.data() as Map)['transferUrlImage'] ?? "",
          id: doc.id);

  Map<String, dynamic> toJson() => {
        'invoiceId': invoiceId,
        'topUpItem': topUpItem.toModel().toJson(),
        'userId': userId,
        'status': status,
        'paymentMethod': paymentMethod.toModel().toJson(),
        'userEmail': userEmail,
        'quantity': quantity,
        'date': date,
        'transferUrlImage': transferUrlImage,
        'total': total,
        'expiredAt': expiredAt,
        'createdAt': createdAt
      };
}

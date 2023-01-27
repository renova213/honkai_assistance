import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:honkai_assistance/domain/entities/redeem_code.dart';

class RedeemCodeModel extends RedeemCode {
  const RedeemCodeModel(
      {required super.code,
      required super.reward,
      required super.server,
      super.id});

  factory RedeemCodeModel.fromDoc(DocumentSnapshot doc) => RedeemCodeModel(
      code: (doc.data() as Map)['code'],
      reward: (doc.data() as Map)['reward'],
      server: (doc.data() as Map)['server'],
      id: doc.id);
}

import 'package:honkai_assistance/domain/entities/redeem_code_entity.dart';

class RedeemCodeModel extends RedeemCodeEntity {
  const RedeemCodeModel(
      {required super.code, required super.reward, required super.server});

  factory RedeemCodeModel.fromMap(Map<String, dynamic> map) => RedeemCodeModel(
      code: map['code'], reward: map['reward'], server: map['server']);
}

import 'package:honkai_lab/domain/entities/active_code.dart';

class ActiveCodeModel extends ActiveCode {
  const ActiveCodeModel(
      {required super.code,
      required super.reward,
      required super.isActive,
      required super.server});

  factory ActiveCodeModel.fromMap(Map<String, dynamic> json) => ActiveCodeModel(
        code: json['code'],
        reward: json['reward'],
        isActive: json['isActive'],
        server: json['server'],
      );
}

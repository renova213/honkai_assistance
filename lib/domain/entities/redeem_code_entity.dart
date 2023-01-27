import 'package:equatable/equatable.dart';

class RedeemCodeEntity extends Equatable {
  final String? id;
  final String code;
  final String reward;
  final String server;

  const RedeemCodeEntity(
      {required this.code,
      required this.reward,
      required this.server,
      this.id});

  @override
  List<Object?> get props => [id, code, reward, server];
}

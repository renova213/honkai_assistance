import 'package:equatable/equatable.dart';

class RedeemCodeEntity extends Equatable {
  final String code;
  final String reward;
  final String server;

  const RedeemCodeEntity(
      {required this.code, required this.reward, required this.server});

  @override
  List<Object?> get props => [code, reward, server];
}

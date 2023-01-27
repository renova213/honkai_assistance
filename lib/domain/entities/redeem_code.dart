import 'package:equatable/equatable.dart';

class RedeemCode extends Equatable {
  final String? id;
  final String code;
  final String reward;
  final String server;

  const RedeemCode(
      {required this.code,
      required this.reward,
      required this.server,
      this.id});

  @override
  List<Object?> get props => [id, code, reward, server];
}

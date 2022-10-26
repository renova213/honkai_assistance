import 'package:equatable/equatable.dart';

class ActiveCode extends Equatable {
  final String code;
  final String reward;
  final String server;
  final bool isActive;

  const ActiveCode(
      {required this.code,
      required this.reward,
      required this.isActive,
      required this.server});
  @override
  List<Object> get props => [code, reward, isActive, server];
}

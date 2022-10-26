part of 'redeem_code_bloc.dart';

abstract class RedeemCodeState extends Equatable {
  const RedeemCodeState();

  @override
  List<Object> get props => [];
}

class EmptyRedeemCode extends RedeemCodeState {}

class LoadingRedeemCode extends RedeemCodeState {}

class ActiveCodeState extends RedeemCodeState {
  final List<ActiveCode> codesSea;
  final List<ActiveCode> codesGlobal;

  const ActiveCodeState(
      {this.codesGlobal = const [], this.codesSea = const []});
  @override
  List<Object> get props => [codesGlobal, codesGlobal];
}

class ErrorRedeemCode extends RedeemCodeState {
  final String errorMessage;

  const ErrorRedeemCode({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

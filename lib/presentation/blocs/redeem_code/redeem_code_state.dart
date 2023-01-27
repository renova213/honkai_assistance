part of 'redeem_code_bloc.dart';

abstract class RedeemCodeState extends Equatable {
  const RedeemCodeState();

  @override
  List<Object> get props => [];
}

class EmptyRedeemCode extends RedeemCodeState {}

class LoadingRedeemCode extends RedeemCodeState {}

class LoadedRedeemCode extends RedeemCodeState {
  final List<RedeemCode> redeemCodesSea;
  final List<RedeemCode> redeemCodesGlobal;

  const LoadedRedeemCode(
      {required this.redeemCodesSea, required this.redeemCodesGlobal});
  @override
  List<Object> get props => [redeemCodesSea, redeemCodesGlobal];
}

class ErrorRedeemCode extends RedeemCodeState {
  final String errorMessage;

  const ErrorRedeemCode({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

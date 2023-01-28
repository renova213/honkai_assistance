part of 'redeem_code_bloc.dart';

abstract class RedeemCodeState extends Equatable {
  const RedeemCodeState();

  @override
  List<Object> get props => [];
}

class EmptyRedeemCodeState extends RedeemCodeState {}

class LoadingRedeemCodeState extends RedeemCodeState {}

class LoadedRedeemCodeState extends RedeemCodeState {
  final List<RedeemCodeEntity> redeemCodesSea;
  final List<RedeemCodeEntity> redeemCodesGlobal;

  const LoadedRedeemCodeState(
      {required this.redeemCodesSea, required this.redeemCodesGlobal});
  @override
  List<Object> get props => [redeemCodesSea, redeemCodesGlobal];
}

class ErrorRedeemCodeState extends RedeemCodeState {
  final String errorMessage;

  const ErrorRedeemCodeState({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

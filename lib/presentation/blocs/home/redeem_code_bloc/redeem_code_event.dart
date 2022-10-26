part of 'redeem_code_bloc.dart';

abstract class RedeemCodeEvent extends Equatable {
  const RedeemCodeEvent();

  @override
  List<Object> get props => [];
}

class FetchActiveCode extends RedeemCodeEvent {}

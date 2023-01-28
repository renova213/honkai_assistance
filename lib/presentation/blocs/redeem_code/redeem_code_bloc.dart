import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honkai_assistance/domain/entities/redeem_code_entity.dart';
import 'package:honkai_assistance/domain/usecases/get_redeem_code.dart';

part 'redeem_code_event.dart';
part 'redeem_code_state.dart';

class RedeemCodeBloc extends Bloc<RedeemCodeEvent, RedeemCodeState> {
  final GetRedeemCode getRedeemCode;
  RedeemCodeBloc({required this.getRedeemCode})
      : super(EmptyRedeemCodeState()) {
    on<GetRedeemCodeEvent>(
      (event, emit) async {
        emit(LoadingRedeemCodeState());

        final failureOrRedeemCodes = await getRedeemCode();

        failureOrRedeemCodes.fold(
          (failure) =>
              emit(ErrorRedeemCodeState(errorMessage: failure.message)),
          (redeemCodes) {
            List<RedeemCodeEntity> redeemCodesSea = [];
            List<RedeemCodeEntity> redeemCodesGlobal = [];

            for (var i in redeemCodes) {
              if (i.server.toLowerCase() == "global" &&
                  !redeemCodesGlobal.contains(i)) {
                redeemCodesGlobal.add(i);
              }
              if (i.server.toLowerCase() == "sea" &&
                  !redeemCodesSea.contains(i)) {
                redeemCodesSea.add(i);
              }
              emit(LoadedRedeemCodeState(
                  redeemCodesGlobal: redeemCodesGlobal,
                  redeemCodesSea: redeemCodesSea));
            }
          },
        );
      },
    );
  }
}

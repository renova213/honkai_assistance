import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honkai_assistance/domain/entities/redeem_code.dart';
import 'package:honkai_assistance/domain/usecases/get_redeem_code.dart';

part 'redeem_code_event.dart';
part 'redeem_code_state.dart';

class RedeemCodeBloc extends Bloc<RedeemCodeEvent, RedeemCodeState> {
  final GetRedeemCode getRedeemCode;
  RedeemCodeBloc({required this.getRedeemCode}) : super(EmptyRedeemCode()) {
    on<RedeemCodeEvent>(
      (event, emit) async {
        emit(LoadingRedeemCode());

        final failureOrRedeemCodes = await getRedeemCode('redeem_code');

        failureOrRedeemCodes.fold(
          (failure) => ErrorRedeemCode(errorMessage: failure.message),
          (redeemCodes) {
            List<RedeemCode> redeemCodesSea = [];
            List<RedeemCode> redeemCodesGlobal = [];

            for (var i in redeemCodes) {
              if (i.server.toLowerCase() == "global" &&
                  !redeemCodesGlobal.contains(i)) {
                redeemCodesGlobal.add(i);
              }
              if (i.server.toLowerCase() == "sea" &&
                  !redeemCodesSea.contains(i)) {
                redeemCodesSea.add(i);
              }
              emit(LoadedRedeemCode(
                  redeemCodesGlobal: redeemCodesGlobal,
                  redeemCodesSea: redeemCodesSea));
            }
          },
        );
      },
    );
  }
}

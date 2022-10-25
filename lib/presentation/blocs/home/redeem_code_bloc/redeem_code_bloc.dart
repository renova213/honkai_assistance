import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honkai_lab/domain/entities/active_code.dart';
import 'package:honkai_lab/domain/usecases/get_active_codes.dart';

import '../../../../common/errors/failure.dart';

part 'redeem_code_event.dart';
part 'redeem_code_state.dart';

class RedeemCodeBloc extends Bloc<RedeemCodeEvent, RedeemCodeState> {
  final GetActiveCodes getActiveCodes;

  RedeemCodeBloc({required this.getActiveCodes}) : super(EmptyRedeemCode()) {
    on<RedeemCodeEvent>((event, emit) async {
      emit(
        LoadingRedeemCode(),
      );
      final failureOrActiveCode = await getActiveCodes("redeem_code");

      failureOrActiveCode.fold(
          (failure) => emit(
                ErrorRedeemCode(
                  errorMessage: _mapFailureOrMessage(failure),
                ),
              ), (activeCode) {
        List<ActiveCode> codesSea = [];
        List<ActiveCode> codesGlobal = [];

        for (var i in activeCode) {
          if (i.server.toLowerCase() == "global" && !codesGlobal.contains(i)) {
            codesGlobal.add(i);
          }
          if (i.server.toLowerCase() == "sea" && !codesSea.contains(i)) {
            codesSea.add(i);
          }
          emit(ActiveCodeState(codesGlobal: codesGlobal, codesSea: codesSea));
        }
      });
    });
  }

  String _mapFailureOrMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'ServerFailure';
      default:
        return 'Unexpected Error';
    }
  }
}

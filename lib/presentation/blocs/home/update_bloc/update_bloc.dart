import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honkai_lab/domain/entities/latest_update.dart';
import 'package:honkai_lab/domain/usecases/get_last_update.dart';

import '../../../../common/errors/failure.dart';

part 'update_event.dart';
part 'update_state.dart';

class UpdateBloc extends Bloc<UpdateEvent, UpdateState> {
  final GetLatestUpdate getLatestUpdate;
  UpdateBloc({required this.getLatestUpdate}) : super(UpdateEmpty()) {
    on<FetchUpdate>(
      (event, emit) async {
        emit(
          UpdateLoading(),
        );
        final failureOrLatestUpdate = await getLatestUpdate("update");

        failureOrLatestUpdate.fold(
          (failure) => emit(
            UpdateError(
              errorMessage: _mapFailureOrMessage(failure),
            ),
          ),
          (latestUpdate) => emit(
            UpdateLoaded(listUpdates: latestUpdate),
          ),
        );
      },
    );
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

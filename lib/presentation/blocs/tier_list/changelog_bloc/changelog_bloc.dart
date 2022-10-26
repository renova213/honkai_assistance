import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honkai_lab/domain/entities/changelog.dart';
import 'package:honkai_lab/domain/usecases/get_changelog.dart';

import '../../../../common/errors/failure.dart';

part 'changelog_event.dart';
part 'changelog_state.dart';

class ChangelogBloc extends Bloc<ChangelogEvent, ChangelogState> {
  final GetChangelog getChangelog;
  ChangelogBloc({required this.getChangelog}) : super(EmptyChangelog()) {
    on<FetchChangelog>(
      (event, emit) async {
        emit(
          LoadingChangelog(),
        );
        final failureOrChangelog = await getChangelog("changelog");

        failureOrChangelog.fold(
          (failure) => emit(
            ErrorChangelog(
              errorMessage: _mapFailureOrMessage(failure),
            ),
          ),
          (changelog) => emit(
            LoadedChangelog(changelogs: changelog),
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

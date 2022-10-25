import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honkai_lab/domain/entities/elf_banner.dart';
import 'package:honkai_lab/domain/usecases/get_elf_banner.dart';

import '../../../../common/errors/failure.dart';

part 'elf_banner_event.dart';
part 'elf_banner_state.dart';

class ElfBannerBloc extends Bloc<ElfBannerEvent, ElfBannerState> {
  final GetElfBanner getElfBanner;
  ElfBannerBloc({required this.getElfBanner}) : super(EmptyElfBanner()) {
    on<FetchElfBanner>(
      (event, emit) async {
        emit(
          LoadingElfBanner(),
        );
        final failureOrElfBanner = await getElfBanner("elf_banner");

        failureOrElfBanner.fold(
          (failure) => emit(
            ErrorElfBanner(
              errorMessage: _mapFailureOrMessage(failure),
            ),
          ),
          (elfBanner) => emit(
            LoadedElfBanner(elfBanners: elfBanner),
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

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/elf_banner_entity.dart';
import '../../../domain/usecases/get_elf_banner.dart';

part 'elf_banner_event.dart';
part 'elf_banner_state.dart';

class ElfBannerBloc extends Bloc<ElfBannerEvent, ElfBannerState> {
  final GetElfBanner getElfBanner;
  ElfBannerBloc({required this.getElfBanner}) : super(EmptyElfBannerState()) {
    on<ElfBannerEvent>((event, emit) async {
      emit(LoadingElfBannerState());

      final failureOrElfBanner = await getElfBanner.call();

      failureOrElfBanner.fold(
        (failure) => emit(ErrorElfBannerState(message: failure.message)),
        (elfBanners) => emit(LoadedElfBannerState(elfBanners: elfBanners)),
      );
    });
  }
}

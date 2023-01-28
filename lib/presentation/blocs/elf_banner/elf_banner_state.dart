part of 'elf_banner_bloc.dart';

abstract class ElfBannerState extends Equatable {
  const ElfBannerState();

  @override
  List<Object> get props => [];
}

class EmptyElfBannerState extends ElfBannerState {}

class LoadingElfBannerState extends ElfBannerState {}

class LoadedElfBannerState extends ElfBannerState {
  final List<ElfBannerEntity> elfBanners;

  const LoadedElfBannerState({required this.elfBanners});

  @override
  List<Object> get props => [elfBanners];
}

class ErrorElfBannerState extends ElfBannerState {
  final String message;
  const ErrorElfBannerState({required this.message});

  @override
  List<Object> get props => [message];
}

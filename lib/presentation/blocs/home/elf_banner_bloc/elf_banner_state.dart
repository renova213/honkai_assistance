part of 'elf_banner_bloc.dart';

abstract class ElfBannerState extends Equatable {
  const ElfBannerState();

  @override
  List<Object> get props => [];
}

class EmptyElfBanner extends ElfBannerState {}

class LoadingElfBanner extends ElfBannerState {}

class LoadedElfBanner extends ElfBannerState {
  final List<ElfBanner> elfBanners;

  const LoadedElfBanner({this.elfBanners = const []});
  @override
  List<Object> get props => [elfBanners];
}

class ErrorElfBanner extends ElfBannerState {
  final String errorMessage;

  const ErrorElfBanner({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

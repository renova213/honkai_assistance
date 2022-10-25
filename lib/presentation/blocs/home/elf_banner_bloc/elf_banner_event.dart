part of 'elf_banner_bloc.dart';

abstract class ElfBannerEvent extends Equatable {
  const ElfBannerEvent();

  @override
  List<Object> get props => [];
}

class FetchElfBanner extends ElfBannerEvent {}

part of 'character_banner_bloc.dart';

abstract class CharacterBannerState extends Equatable {
  const CharacterBannerState();

  @override
  List<Object> get props => [];
}

class EmptyCharacterBannerState extends CharacterBannerState {}

class LoadingCharacterBannerState extends CharacterBannerState {}

class LoadedCharacterBannerState extends CharacterBannerState {
  final List<CharacterBannerEntity> characterBanners;

  const LoadedCharacterBannerState({required this.characterBanners});

  @override
  List<Object> get props => [characterBanners];
}

class ErrorCharacterBannerState extends CharacterBannerState {
  final String message;
  const ErrorCharacterBannerState({required this.message});

  @override
  List<Object> get props => [message];
}

part of 'banner_character_bloc.dart';

abstract class BannerCharacterState extends Equatable {
  const BannerCharacterState();

  @override
  List<Object> get props => [];
}

class EmptyBannerCharacter extends BannerCharacterState {}

class LoadingBannerCharacter extends BannerCharacterState {}

class LoadedBannerCharacter extends BannerCharacterState {
  final List<BannerCharacter> characterBanners;

  const LoadedBannerCharacter({this.characterBanners = const []});
  @override
  List<Object> get props => [characterBanners];
}

class ErrorBannerCharacter extends BannerCharacterState {
  final String errorMessage;

  const ErrorBannerCharacter({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

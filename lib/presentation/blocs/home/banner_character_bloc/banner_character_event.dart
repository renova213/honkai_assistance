part of 'banner_character_bloc.dart';

abstract class BannerCharacterEvent extends Equatable {
  const BannerCharacterEvent();

  @override
  List<Object> get props => [];
}

class FetchBannerCharacter extends BannerCharacterEvent {}

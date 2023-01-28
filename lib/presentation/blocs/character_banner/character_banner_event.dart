part of 'character_banner_bloc.dart';

abstract class CharacterBannerEvent extends Equatable {
  const CharacterBannerEvent();

  @override
  List<Object> get props => [];
}

class GetCharacterBannerEvent extends CharacterBannerEvent {}

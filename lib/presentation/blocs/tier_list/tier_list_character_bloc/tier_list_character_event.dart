part of 'tier_list_character_bloc.dart';

abstract class TierListCharacterEvent extends Equatable {
  const TierListCharacterEvent();

  @override
  List<Object> get props => [];
}

class FetchTierListCharacter extends TierListCharacterEvent {}

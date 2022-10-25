part of 'tier_list_character_bloc.dart';

abstract class TierListCharacterState extends Equatable {
  const TierListCharacterState();

  @override
  List<Object> get props => [];
}

class EmptyTierListCharacter extends TierListCharacterState {}

class LoadingTierListCharacter extends TierListCharacterState {}

class LoadedTierListCharacter extends TierListCharacterState {
  final List<Character> tierExDpsCharacters;
  final List<Character> tierSDpsCharacter;
  final List<Character> tierADpsCharacter;
  final List<Character> tierBDpsCharacter;
  final List<Character> tierExSupportCharacters;
  final List<Character> tierSSupportCharacters;

  const LoadedTierListCharacter(
      {this.tierExDpsCharacters = const [],
      this.tierSDpsCharacter = const [],
      this.tierADpsCharacter = const [],
      this.tierBDpsCharacter = const [],
      this.tierExSupportCharacters = const [],
      this.tierSSupportCharacters = const []});
  @override
  List<Object> get props => [
        tierExDpsCharacters,
        tierSDpsCharacter,
        tierADpsCharacter,
        tierBDpsCharacter,
        tierExSupportCharacters,
        tierSSupportCharacters
      ];
}

class ErrorTierListCharacter extends TierListCharacterState {
  final String errorMessage;

  const ErrorTierListCharacter({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

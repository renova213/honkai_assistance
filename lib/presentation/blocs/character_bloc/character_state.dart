part of 'character_bloc.dart';

abstract class CharacterState extends Equatable {
  const CharacterState();

  @override
  List<Object> get props => [];
}

class EmptyCharacter extends CharacterState {}

class LoadingCharacter extends CharacterState {}

class LoadedCharacter extends CharacterState {
  final List<Character> characters;

  const LoadedCharacter({this.characters = const []});
  @override
  List<Object> get props => [characters];
}

class ErrorCharacter extends CharacterState {
  final String errorMessage;

  const ErrorCharacter({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

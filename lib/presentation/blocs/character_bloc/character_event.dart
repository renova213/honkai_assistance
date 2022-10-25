part of 'character_bloc.dart';

abstract class CharacterEvent extends Equatable {
  const CharacterEvent();

  @override
  List<Object> get props => [];
}

class FetchCharacter extends CharacterEvent {
  final String value;
  const FetchCharacter({this.value = ""});

  @override
  List<Object> get props => [value];
}

class SearchCharacter extends CharacterEvent {
  final String value;
  const SearchCharacter({required this.value});

  @override
  List<Object> get props => [value];
}

class SortAscending extends CharacterEvent {
  final String value;
  const SortAscending({required this.value});

  @override
  List<Object> get props => [value];
}

class SortDescending extends CharacterEvent {
  final String value;
  const SortDescending({required this.value});

  @override
  List<Object> get props => [value];
}

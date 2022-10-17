import 'package:equatable/equatable.dart';

class Changelog extends Equatable {
  final String date;
  final List<CharacterLog> characterLog;

  const Changelog({required this.characterLog, required this.date});

  @override
  List<Object> get props => [];
}

class CharacterLog extends Equatable {
  final String nameCharacter;
  final String tierBefore;
  final String tierCurrent;
  final String urlImage;

  const CharacterLog(
      {required this.nameCharacter,
      required this.tierBefore,
      required this.tierCurrent,
      required this.urlImage});

  @override
  List<Object> get props => [nameCharacter, tierBefore, tierCurrent, urlImage];
}

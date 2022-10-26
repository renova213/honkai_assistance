import 'package:honkai_lab/domain/entities/changelog.dart';

class ChangelogModel extends Changelog {
  const ChangelogModel({required super.characterLog, required super.date});

  factory ChangelogModel.fromMap(Map<String, dynamic> json) => ChangelogModel(
      date: json["date"],
      characterLog: (json["data"] as List)
          .map((e) => CharacterLogModel.fromMap(e))
          .toList());
}

class CharacterLogModel extends CharacterLog {
  const CharacterLogModel(
      {required super.nameCharacter,
      required super.tierBefore,
      required super.tierCurrent,
      required super.urlImage});

  factory CharacterLogModel.fromMap(Map<String, dynamic> json) =>
      CharacterLogModel(
        nameCharacter: json["nameCharacter"],
        tierBefore: json["tierBefore"],
        tierCurrent: json["tierCurrent"],
        urlImage: json["urlImage"],
      );
}

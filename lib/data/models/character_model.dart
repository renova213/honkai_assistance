import 'package:honkai_lab/domain/entities/character.dart';

class CharacterModel extends Character {
  const CharacterModel(
      {required super.element,
      required super.image,
      required super.imageChibi,
      required super.nameCharacter,
      required super.tier,
      required super.elementImage});

  factory CharacterModel.fromMap(Map<String, dynamic> json) => CharacterModel(
        element: json["element"],
        image: json["image"],
        imageChibi: json["imageChibi"],
        nameCharacter: json["nameCharacter"],
        tier: json["tier"],
        elementImage: json["elementImage"],
      );
}

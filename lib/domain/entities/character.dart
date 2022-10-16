import 'package:equatable/equatable.dart';

class Character extends Equatable {
  final String element;
  final String image;
  final String imageChibi;
  final String nameCharacter;
  final String tier;
  final String elementImage;

  const Character(
      {required this.element,
      required this.image,
      required this.imageChibi,
      required this.nameCharacter,
      required this.tier,
      required this.elementImage});

  @override
  List<Object> get props =>
      [element, image, imageChibi, nameCharacter, tier, elementImage];
}

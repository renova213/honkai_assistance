import 'package:equatable/equatable.dart';

class StigmataEntity extends Equatable {
  final String stigmataName;
  final String stigmataImage;
  final List<StigmataItemEntity>? stigmataItems;
  final List<SetEffectEntity>? setEffects;

  const StigmataEntity(
      {this.stigmataItems,
      required this.stigmataName,
      required this.stigmataImage,
      required this.setEffects});

  @override
  List<Object> get props =>
      [stigmataName, stigmataImage, stigmataItems!, setEffects!];
}

class StigmataItemEntity extends Equatable {
  final String? stigmataPieceName;
  final String? stigmataType;
  final String? star;
  final String? stigmataImage;
  final List<StigmataEffectEntity>? stigmataEffects;

  const StigmataItemEntity(
      {this.stigmataPieceName,
      this.stigmataType,
      this.star,
      this.stigmataImage,
      this.stigmataEffects});

  @override
  List<Object> get props => [
        stigmataPieceName!,
        stigmataType!,
        star!,
        stigmataImage!,
        stigmataEffects!
      ];
}

class StigmataEffectEntity extends Equatable {
  final String titleEffect;
  final String descriptionEffect;

  const StigmataEffectEntity(
      {required this.titleEffect, required this.descriptionEffect});

  @override
  List<Object> get props => [titleEffect, descriptionEffect];
}

class SetEffectEntity extends Equatable {
  final String setName;
  final String description;

  const SetEffectEntity({required this.setName, required this.description});

  @override
  List<Object> get props => [setName, setName];
}

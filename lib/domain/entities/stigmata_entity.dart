import 'package:equatable/equatable.dart';

class StigmataEntity extends Equatable {
  final String stigmataName;
  final String stigmataImage;
  final List<StigmataItemEntity>? stigmataItems;

  const StigmataEntity(
      {this.stigmataItems,
      required this.stigmataName,
      required this.stigmataImage});

  @override
  List<Object> get props => [stigmataName, stigmataImage, stigmataItems!];
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

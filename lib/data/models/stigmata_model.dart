import 'package:honkai_assistance/domain/entities/stigmata_entity.dart';

class StigmataModel extends StigmataEntity {
  const StigmataModel(
      {required super.stigmataName,
      required super.stigmataImage,
      super.stigmataItems});

  factory StigmataModel.fromMap(Map<String, dynamic> map) => StigmataModel(
      stigmataItems: map['stigmataItems'] != null
          ? (map['stigmataItems'] as List)
              .map((e) => StigmataItemModel.fromMap(e))
              .toList()
          : [],
      stigmataImage: map['stigmataImage'],
      stigmataName: map['stigmataName']);
}

class StigmataItemModel extends StigmataItemEntity {
  const StigmataItemModel(
      {super.stigmataPieceName,
      super.stigmataEffects,
      super.star,
      super.stigmataImage,
      super.stigmataType});

  factory StigmataItemModel.fromMap(Map<String, dynamic> map) =>
      StigmataItemModel(
          stigmataPieceName: map['stigmataPieceName'],
          stigmataType: map['stigmataType'],
          star: map['star'],
          stigmataImage: map['stigmataImage'],
          stigmataEffects: map['stigmataEffects'] != null
              ? (map['stigmataEffects'] as List)
                  .map((e) => StigmataEffectModel.fromMap(e))
                  .toList()
              : []);
}

class StigmataEffectModel extends StigmataEffectEntity {
  const StigmataEffectModel(
      {required super.titleEffect, required super.descriptionEffect});

  factory StigmataEffectModel.fromMap(Map<String, dynamic> map) =>
      StigmataEffectModel(
          titleEffect: map['titleEffect'],
          descriptionEffect: map['descriptionEffect']);
}

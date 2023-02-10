import 'package:honkai_assistance/domain/entities/outfit_entity.dart';

class OutfitModel extends OutfitEntity {
  const OutfitModel(
      {required super.outfitName,
      required super.outfitImage,
      required super.grade,
      required super.outfitIcon});

  factory OutfitModel.fromMap(Map<String, dynamic> map) => OutfitModel(
      outfitIcon: map['outfitIcon'],
      outfitName: map['outfitName'],
      outfitImage: map['outfitImage'],
      grade: map['grade']);
}

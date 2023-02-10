import 'package:honkai_assistance/domain/entities/character_banner_entity.dart';

class CharacterBannerModel extends CharacterBannerEntity {
  const CharacterBannerModel(
      {required super.urlImage, required super.title, required super.endDate});

  factory CharacterBannerModel.fromMap(Map<String, dynamic> map) =>
      CharacterBannerModel(
          urlImage: map['urlImage'],
          title: map['title'],
          endDate: map['endDate']);
}

import 'package:honkai_lab/domain/entities/banner_character.dart';

class BannerCharacterModel extends BannerCharacter {
  const BannerCharacterModel(
      {required super.urlImage,
      required super.endDate,
      required super.nameCharacter});

  factory BannerCharacterModel.fromMap(Map<String, dynamic> json) =>
      BannerCharacterModel(
        urlImage: json['urlImage'],
        endDate: json['endDate'],
        nameCharacter: json['nameCharacter'],
      );
}

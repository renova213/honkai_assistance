import 'package:honkai_lab/domain/entities/weapon_stigmata_banner.dart';

class WeaponStigmaBannerModel extends WeaponStigmataBanner {
  const WeaponStigmaBannerModel(
      {required super.urlImageWeapon,
      required super.urlImageStigmata,
      required super.endDate,
      required super.nameWeapon,
      required super.nameStigmata});

  factory WeaponStigmaBannerModel.fromMap(Map<String, dynamic> json) =>
      WeaponStigmaBannerModel(
        urlImageWeapon: json['urlImageWeapon'],
        urlImageStigmata: json['urlImageStigmata'],
        endDate: json['endDate'],
        nameWeapon: json['nameWeapon'],
        nameStigmata: json['nameStigmata'],
      );
}

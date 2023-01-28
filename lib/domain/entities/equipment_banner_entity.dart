import 'package:equatable/equatable.dart';

class EquipmentBannerEntity extends Equatable {
  final String urlWeaponImage;
  final String urlStigmataImage;
  final String weaponName;
  final String stigmataName;
  final String endDate;

  const EquipmentBannerEntity(
      {required this.urlWeaponImage,
      required this.urlStigmataImage,
      required this.weaponName,
      required this.stigmataName,
      required this.endDate});

  @override
  List<Object> get props =>
      [urlWeaponImage, urlStigmataImage, weaponName, stigmataName, endDate];
}

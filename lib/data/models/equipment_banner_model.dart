import 'package:honkai_assistance/domain/entities/equipment_banner_entity.dart';

class EquipmentBannerModel extends EquipmentBannerEntity {
  const EquipmentBannerModel(
      {required super.urlWeaponImage,
      required super.urlStigmataImage,
      required super.weaponName,
      required super.stigmataName,
      required super.endDate});

  factory EquipmentBannerModel.fromMap(Map<String, dynamic> map) =>
      EquipmentBannerModel(
          urlWeaponImage: map['urlWeaponImage'],
          urlStigmataImage: map['urlStigmataImage'],
          weaponName: map['weaponName'],
          stigmataName: map['stigmataName'],
          endDate: map['endDate']);
}

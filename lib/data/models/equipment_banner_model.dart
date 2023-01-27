import 'package:cloud_firestore/cloud_firestore.dart';

class EquipmentBannerModel {
  final String? id;
  final String urlWeaponImage;
  final String urlStigmataImage;
  final String weaponName;
  final String stigmataName;
  final String endDate;

  EquipmentBannerModel(
      {this.id,
      required this.urlWeaponImage,
      required this.urlStigmataImage,
      required this.weaponName,
      required this.stigmataName,
      required this.endDate});

  factory EquipmentBannerModel.fromDoc(DocumentSnapshot doc) =>
      EquipmentBannerModel(
        id: doc.id,
        urlWeaponImage: (doc.data() as Map)['urlWeaponImage'],
        urlStigmataImage: (doc.data() as Map)['urlStigmataImage'],
        weaponName: (doc.data() as Map)['weaponName'],
        stigmataName: (doc.data() as Map)['stigmataName'],
        endDate: (doc.data() as Map)['endDate'],
      );

  Map<String, dynamic> toJson() => {
        'urlWeaponImage': urlWeaponImage,
        'urlStigmataImage': urlStigmataImage,
        'weaponName': weaponName,
        'stigmataName': stigmataName,
        'endDate': endDate
      };
}

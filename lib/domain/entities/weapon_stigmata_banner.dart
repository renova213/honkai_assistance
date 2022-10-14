import 'package:equatable/equatable.dart';

class WeaponStigmataBanner extends Equatable {
  final String urlImageWeapon;
  final String urlImageStigmata;
  final String nameWeapon;
  final String nameStigmata;
  final String endDate;

  const WeaponStigmataBanner(
      {required this.urlImageWeapon,
      required this.urlImageStigmata,
      required this.endDate,
      required this.nameWeapon,
      required this.nameStigmata});
  @override
  List<Object?> get props =>
      [urlImageWeapon, urlImageStigmata, nameWeapon, endDate, nameStigmata];
}

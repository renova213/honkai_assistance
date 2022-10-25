part of 'weapon_stigmata_bloc_bloc.dart';

abstract class WeaponStigmataState extends Equatable {
  const WeaponStigmataState();

  @override
  List<Object> get props => [];
}

class EmptyWeaponStigmataBanner extends WeaponStigmataState {}

class LoadingWeaponStigmataBanner extends WeaponStigmataState {}

class LoadedWeaponStigmataBanner extends WeaponStigmataState {
  final List<WeaponStigmataBanner> weaponStigmataBanners;

  const LoadedWeaponStigmataBanner({this.weaponStigmataBanners = const []});
  @override
  List<Object> get props => [weaponStigmataBanners];
}

class ErrorWeaponStigmataBanner extends WeaponStigmataState {
  final String errorMessage;

  const ErrorWeaponStigmataBanner({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

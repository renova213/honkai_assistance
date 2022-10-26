part of 'weapon_stigmata_bloc_bloc.dart';

abstract class WeaponStigmataEvent extends Equatable {
  const WeaponStigmataEvent();

  @override
  List<Object> get props => [];
}

class FetchWeaponStigmataBanner extends WeaponStigmataEvent {}

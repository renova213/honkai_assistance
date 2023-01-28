part of 'equipment_banner_bloc.dart';

abstract class EquipmentBannerState extends Equatable {
  const EquipmentBannerState();

  @override
  List<Object> get props => [];
}

class EmptyEquipmentBannerState extends EquipmentBannerState {}

class LoadingEquipmentBannerState extends EquipmentBannerState {}

class LoadedEquipmentBannerState extends EquipmentBannerState {
  final List<EquipmentBannerEntity> equipmentBanners;

  const LoadedEquipmentBannerState({required this.equipmentBanners});

  @override
  List<Object> get props => [equipmentBanners];
}

class ErrorEquipmentBannerState extends EquipmentBannerState {
  final String message;
  const ErrorEquipmentBannerState({required this.message});

  @override
  List<Object> get props => [message];
}

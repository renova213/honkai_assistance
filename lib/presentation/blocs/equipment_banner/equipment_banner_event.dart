part of 'equipment_banner_bloc.dart';

abstract class EquipmentBannerEvent extends Equatable {
  const EquipmentBannerEvent();

  @override
  List<Object> get props => [];
}

class GetEquipmentBannerEvent extends EquipmentBannerEvent {}

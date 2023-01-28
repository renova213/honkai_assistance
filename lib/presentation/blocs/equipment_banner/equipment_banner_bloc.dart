import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:honkai_assistance/domain/entities/equipment_banner_entity.dart';
import 'package:honkai_assistance/domain/usecases/get_equipment_banner.dart';

part 'equipment_banner_event.dart';
part 'equipment_banner_state.dart';

class EquipmentBannerBloc
    extends Bloc<EquipmentBannerEvent, EquipmentBannerState> {
  final GetEquipmentBanner getEquipmentBanner;
  EquipmentBannerBloc({required this.getEquipmentBanner})
      : super(EmptyEquipmentBannerState()) {
    on<GetEquipmentBannerEvent>((event, emit) async {
      emit(LoadingEquipmentBannerState());

      final failureOrEvent = await getEquipmentBanner.call();

      failureOrEvent.fold(
        (failure) => emit(ErrorEquipmentBannerState(message: failure.message)),
        (equipmentBanners) => emit(
            LoadedEquipmentBannerState(equipmentBanners: equipmentBanners)),
      );
    });
  }
}

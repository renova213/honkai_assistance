import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:honkai_lab/domain/entities/weapon_stigmata_banner.dart';
import 'package:honkai_lab/domain/usecases/get_weapon_stigma_banner.dart';

import '../../../../common/errors/failure.dart';

part 'weapon_stigmata_bloc_event.dart';
part 'weapon_stigmata_bloc_state.dart';

class WeaponStigmataBloc
    extends Bloc<WeaponStigmataEvent, WeaponStigmataState> {
  final GetWeaponStigmaBanner getWeaponStigmaBanner;
  WeaponStigmataBloc({required this.getWeaponStigmaBanner})
      : super(EmptyWeaponStigmataBanner()) {
    on<FetchWeaponStigmataBanner>((event, emit) async {
      emit(
        LoadingWeaponStigmataBanner(),
      );
      final failureOrWeaponStigmataBanners =
          await getWeaponStigmaBanner("weapon_stigma_banner");

      failureOrWeaponStigmataBanners.fold(
        (failure) => emit(
          ErrorWeaponStigmataBanner(
            errorMessage: _mapFailureOrMessage(failure),
          ),
        ),
        (weaponStigmataBanners) => emit(
          LoadedWeaponStigmataBanner(
              weaponStigmataBanners: weaponStigmataBanners),
        ),
      );
    });
  }

  String _mapFailureOrMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'ServerFailure';
      default:
        return 'Unexpected Error';
    }
  }
}

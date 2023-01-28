import 'package:dartz/dartz.dart';
import 'package:honkai_assistance/common/error/error.dart';
import 'package:honkai_assistance/domain/entities/equipment_banner_entity.dart';
import 'package:honkai_assistance/domain/repositories/home_repository.dart';

class GetEquipmentBanner {
  final HomeRepository homeRepository;

  GetEquipmentBanner({required this.homeRepository});

  Future<Either<Failure, List<EquipmentBannerEntity>>> call() async {
    final equipmentBanners = await homeRepository.getEquipmentBanner();

    return equipmentBanners;
  }
}

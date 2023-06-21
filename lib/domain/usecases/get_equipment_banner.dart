import 'package:dartz/dartz.dart';
import 'package:honkai_assistance/common/error/error.dart';
import 'package:honkai_assistance/domain/entities/equipment_banner_entity.dart';
import 'package:honkai_assistance/domain/repositories/remote_repository.dart';

class GetEquipmentBanner {
  final RemoteRepository remoteRepository;

  GetEquipmentBanner({required this.remoteRepository});

  Future<Either<Failure, List<EquipmentBannerEntity>>> call() async {
    final equipmentBanners = await remoteRepository.getEquipmentBanners();

    return equipmentBanners;
  }
}

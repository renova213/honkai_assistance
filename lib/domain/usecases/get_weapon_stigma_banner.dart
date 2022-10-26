import 'package:dartz/dartz.dart';
import 'package:honkai_lab/domain/entities/weapon_stigmata_banner.dart';

import '../../common/errors/failure.dart';
import '../repositories/honkai_lab_repositories.dart';

class GetWeaponStigmaBanner {
  final HonkaiLabRepositories repositories;

  GetWeaponStigmaBanner({required this.repositories});

  Future<Either<Failure, List<WeaponStigmataBanner>>> call(
      String collectionName) async {
    Either<Failure, List<WeaponStigmataBanner>> activeCodes =
        await repositories.getWeaponStigmaBanner(collectionName);
    return activeCodes;
  }
}

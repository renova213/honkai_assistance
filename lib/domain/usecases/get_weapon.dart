import 'package:dartz/dartz.dart';
import 'package:honkai_assistance/domain/entities/weapon_entity.dart';
import 'package:honkai_assistance/domain/repositories/remote_repository.dart';

import '../../../common/error/failure.dart';

class GetWeapon {
  final RemoteRepository remoteRepository;

  GetWeapon({required this.remoteRepository});

  Future<Either<Failure, List<WeaponEntity>>> call() async {
    Either<Failure, List<WeaponEntity>> weapons =
        await remoteRepository.getWeapon();

    return weapons;
  }
}

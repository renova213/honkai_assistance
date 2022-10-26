import 'package:dartz/dartz.dart';
import 'package:honkai_lab/domain/entities/latest_update.dart';

import '../../common/errors/failure.dart';
import '../repositories/honkai_lab_repositories.dart';

class GetLatestUpdate {
  final HonkaiLabRepositories repositories;

  GetLatestUpdate({required this.repositories});

  Future<Either<Failure, List<LatestUpdate>>> call(
      String collectionName) async {
    Either<Failure, List<LatestUpdate>> activeCodes =
        await repositories.getLatestUpdate(collectionName);
    return activeCodes;
  }
}

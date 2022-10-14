import 'package:dartz/dartz.dart';
import 'package:honkai_lab/common/errors/failure.dart';
import 'package:honkai_lab/domain/entities/active_code.dart';
import 'package:honkai_lab/domain/repositories/honkai_lab_repositories.dart';

class GetActiveCodes {
  final HonkaiLabRepositories repositories;

  GetActiveCodes({required this.repositories});

  Future<Either<Failure, List<ActiveCode>>> call(String collectionName) async {
    Either<Failure, List<ActiveCode>> activeCodes =
        await repositories.getActiveCodes(collectionName);
    return activeCodes;
  }
}

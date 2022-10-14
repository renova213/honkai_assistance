import 'package:dartz/dartz.dart';
import 'package:honkai_lab/domain/entities/event_honkai.dart';

import '../../common/errors/failure.dart';
import '../repositories/honkai_lab_repositories.dart';

class GetEventHonkai {
  final HonkaiLabRepositories repositories;

  GetEventHonkai({required this.repositories});

  Future<Either<Failure, List<EventHonkai>>> call(String collectionName) async {
    Either<Failure, List<EventHonkai>> activeCodes =
        await repositories.getEventHonkai(collectionName);
    return activeCodes;
  }
}

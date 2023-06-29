import 'package:dartz/dartz.dart';
import 'package:honkai_assistance/domain/entities/stigmata_entity.dart';
import 'package:honkai_assistance/domain/repositories/remote_repository.dart';

import '../../../common/error/failure.dart';

class GetStigmata {
  final RemoteRepository remoteRepository;

  GetStigmata({required this.remoteRepository});

  Future<Either<Failure, List<StigmataEntity>>> call() async {
    Either<Failure, List<StigmataEntity>> stigmatas =
        await remoteRepository.getStigmata();

    return stigmatas;
  }
}

import 'package:dartz/dartz.dart';
import 'package:honkai_assistance/domain/entities/outfit_entity.dart';
import 'package:honkai_assistance/domain/repositories/remote_repository.dart';

import '../../../common/error/failure.dart';

class GetOutfit {
  final RemoteRepository remoteRepository;

  GetOutfit({required this.remoteRepository});

  Future<Either<Failure, List<OutfitEntity>>> call() async {
    Either<Failure, List<OutfitEntity>> outfits =
        await remoteRepository.getOutfit();

    return outfits;
  }
}

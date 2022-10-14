import 'package:dartz/dartz.dart';
import 'package:honkai_lab/domain/entities/elf_banner.dart';

import '../../common/errors/failure.dart';
import '../repositories/honkai_lab_repositories.dart';

class GetElfBanner {
  final HonkaiLabRepositories repositories;

  GetElfBanner({required this.repositories});

  Future<Either<Failure, List<ElfBanner>>> call(String collectionName) async {
    Either<Failure, List<ElfBanner>> elfBanner =
        await repositories.getElfBanner(collectionName);
    return elfBanner;
  }
}

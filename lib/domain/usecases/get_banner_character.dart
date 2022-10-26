import 'package:dartz/dartz.dart';
import 'package:honkai_lab/common/errors/failure.dart';
import 'package:honkai_lab/domain/entities/banner_character.dart';
import 'package:honkai_lab/domain/repositories/honkai_lab_repositories.dart';

class GetBannerCharacter {
  final HonkaiLabRepositories repositories;

  GetBannerCharacter({required this.repositories});

  Future<Either<Failure, List<BannerCharacter>>> call(
      String collectionName) async {
    Either<Failure, List<BannerCharacter>> bannerCharacter =
        await repositories.getBannerCharacter(collectionName);
    return bannerCharacter;
  }
}

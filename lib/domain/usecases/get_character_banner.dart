import 'package:dartz/dartz.dart';
import 'package:honkai_assistance/common/error/error.dart';
import 'package:honkai_assistance/domain/entities/character_banner_entity.dart';
import 'package:honkai_assistance/domain/repositories/remote_repository.dart';

class GetCharacterBanner {
  final RemoteRepository remoteRepository;

  GetCharacterBanner({required this.remoteRepository});

  Future<Either<Failure, List<CharacterBannerEntity>>> call() async {
    final characterBanners = await remoteRepository.getCharacterBanner();

    return characterBanners;
  }
}

import 'package:dartz/dartz.dart';
import 'package:honkai_assistance/common/error/error.dart';
import 'package:honkai_assistance/domain/entities/character_banner_entity.dart';
import 'package:honkai_assistance/domain/repositories/home_repository.dart';

class GetCharacterBanner {
  final HomeRepository homeRepository;

  GetCharacterBanner({required this.homeRepository});

  Future<Either<Failure, List<CharacterBannerEntity>>> call() async {
    final characterBanners = await homeRepository.getCharacterBanner();

    return characterBanners;
  }
}

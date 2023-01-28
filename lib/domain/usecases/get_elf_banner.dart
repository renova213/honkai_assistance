import 'package:dartz/dartz.dart';
import 'package:honkai_assistance/common/error/error.dart';
import 'package:honkai_assistance/domain/entities/elf_banner_entity.dart';
import 'package:honkai_assistance/domain/repositories/home_repository.dart';

class GetElfBanner {
  final HomeRepository homeRepository;

  GetElfBanner({required this.homeRepository});

  Future<Either<Failure, List<ElfBannerEntity>>> call() async {
    final elfBanners = await homeRepository.getElfBanners();

    return elfBanners;
  }
}

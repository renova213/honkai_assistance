import 'package:dartz/dartz.dart';
import 'package:honkai_assistance/common/error/error.dart';
import 'package:honkai_assistance/domain/entities/elf_banner_entity.dart';
import 'package:honkai_assistance/domain/repositories/remote_repository.dart';

class GetElfBanner {
  final RemoteRepository remoteRepository;

  GetElfBanner({required this.remoteRepository});

  Future<Either<Failure, List<ElfBannerEntity>>> call() async {
    final elfBanners = await remoteRepository.getElfBanner();

    return elfBanners;
  }
}

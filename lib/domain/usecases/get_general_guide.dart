import 'package:dartz/dartz.dart';
import 'package:honkai_assistance/common/error/error.dart';
import 'package:honkai_assistance/domain/entities/guide_entity.dart';
import 'package:honkai_assistance/domain/repositories/remote_repository.dart';

class GetGeneralGuide {
  final RemoteRepository remoteRepository;

  GetGeneralGuide({required this.remoteRepository});

  Future<Either<Failure, List<GuideEntity>>> call() async {
    final generalGuides = await remoteRepository.getGeneralGuide();

    return generalGuides;
  }
}

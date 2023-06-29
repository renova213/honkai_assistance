import 'package:dartz/dartz.dart';
import 'package:honkai_assistance/common/error/error.dart';
import 'package:honkai_assistance/domain/entities/guide_entity.dart';
import 'package:honkai_assistance/domain/repositories/remote_repository.dart';

class GetBeginnerGuide {
  final RemoteRepository remoteRepository;

  GetBeginnerGuide({required this.remoteRepository});

  Future<Either<Failure, List<GuideEntity>>> call() async {
    final beginnerGuides = await remoteRepository.getBeginnerGuide();

    return beginnerGuides;
  }
}

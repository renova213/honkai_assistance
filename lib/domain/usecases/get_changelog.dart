import 'package:dartz/dartz.dart';
import 'package:honkai_assistance/common/error/error.dart';
import 'package:honkai_assistance/domain/entities/changelog_entity.dart';
import 'package:honkai_assistance/domain/repositories/remote_repository.dart';

class GetChangelog {
  final RemoteRepository remoteRepository;

  GetChangelog({required this.remoteRepository});

  Future<Either<Failure, List<ChangelogEntity>>> call() async {
    final changelogs = await remoteRepository.getChangelog();

    return changelogs;
  }
}

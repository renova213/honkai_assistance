import 'package:dartz/dartz.dart';
import 'package:honkai_lab/common/errors/failure.dart';
import 'package:honkai_lab/domain/entities/changelog.dart';
import 'package:honkai_lab/domain/repositories/honkai_lab_repositories.dart';

class GetChangelog {
  final HonkaiLabRepositories repositories;

  GetChangelog({required this.repositories});

  Future<Either<Failure, Changelog>> call(String collectionName) async {
    Either<Failure, Changelog> changelogs =
        await repositories.getChangelog(collectionName);
    return changelogs;
  }
}

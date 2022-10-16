import 'package:dartz/dartz.dart';
import 'package:honkai_lab/common/errors/failure.dart';
import 'package:honkai_lab/domain/entities/character.dart';
import 'package:honkai_lab/domain/repositories/honkai_lab_repositories.dart';

class GetCharacter {
  final HonkaiLabRepositories repositories;
  GetCharacter({required this.repositories});

  Future<Either<Failure, List<Character>>> call(String collectionName) async {
    Either<Failure, List<Character>> tierExCharacter =
        await repositories.getCharacter(collectionName);

    return tierExCharacter;
  }
}

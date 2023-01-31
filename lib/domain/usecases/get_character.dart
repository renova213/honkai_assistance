import 'package:dartz/dartz.dart';
import 'package:honkai_assistance/common/error/error.dart';
import 'package:honkai_assistance/domain/repositories/remote_repository.dart';

import '../entities/character_entity.dart';

class GetCharacter {
  final RemoteRepository remoteRepository;

  GetCharacter({required this.remoteRepository});

  Future<Either<Failure, List<CharacterEntity>>> call() async {
    final characters = await remoteRepository.getCharacters();

    return characters;
  }
}

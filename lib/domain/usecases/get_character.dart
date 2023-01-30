import 'package:dartz/dartz.dart';
import 'package:honkai_assistance/common/error/error.dart';
import 'package:honkai_assistance/domain/repositories/character_repository.dart';

import '../entities/character_entity.dart';

class GetCharacter {
  final CharacterRepository characterRepository;

  GetCharacter({required this.characterRepository});

  Future<Either<Failure, List<CharacterEntity>>> call() async {
    final characters = await characterRepository.getCharacters();

    return characters;
  }
}

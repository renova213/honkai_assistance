import 'package:dartz/dartz.dart';
import 'package:honkai_assistance/domain/entities/character_entity.dart';

import '../../common/error/failure.dart';

abstract class CharacterRepository {
  Future<Either<Failure, List<CharacterEntity>>> getCharacters();
}

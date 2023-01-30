import 'dart:io';
import 'package:honkai_assistance/domain/entities/character_entity.dart';
import 'package:dartz/dartz.dart';

import '../../common/constant.dart';
import '../../common/error/error.dart';
import '../../domain/repositories/character_repository.dart';
import '../datasources/remote_data_source.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final RemoteDataSource remoteDataSource;
  CharacterRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<CharacterEntity>>> getCharacters() async {
    try {
      final characters = await remoteDataSource.getCharacters();

      return Right(characters);
    } on SocketException {
      return const Left(
        InternetFailure(message: internetError),
      );
    }
  }
}

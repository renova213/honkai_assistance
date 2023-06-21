import 'package:dartz/dartz.dart';
import 'package:honkai_assistance/common/error/error.dart';
import 'package:honkai_assistance/domain/entities/elf_entity.dart';
import 'package:honkai_assistance/domain/repositories/remote_repository.dart';

class GetElf {
  final RemoteRepository remoteRepository;

  GetElf({required this.remoteRepository});

  Future<Either<Failure, List<ElfEntity>>> call() async {
    final elfs = await remoteRepository.getElfs();

    return elfs;
  }
}

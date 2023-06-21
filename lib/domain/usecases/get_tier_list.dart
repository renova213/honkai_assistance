import 'package:dartz/dartz.dart';
import 'package:honkai_assistance/common/error/error.dart';
import 'package:honkai_assistance/domain/entities/tier_list_entity.dart';
import 'package:honkai_assistance/domain/repositories/remote_repository.dart';

class GetTierList {
  final RemoteRepository remoteRepository;

  GetTierList({required this.remoteRepository});

  Future<Either<Failure, List<TierListEntity>>> call() async {
    final tierList = await remoteRepository.getTierList();

    return tierList;
  }
}

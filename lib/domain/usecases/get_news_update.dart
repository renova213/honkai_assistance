import 'package:dartz/dartz.dart';
import 'package:honkai_assistance/common/error/error.dart';
import 'package:honkai_assistance/domain/entities/news_update_entity.dart';
import 'package:honkai_assistance/domain/repositories/remote_repository.dart';

class GetNewsUpdate {
  final RemoteRepository remoteRepository;

  GetNewsUpdate({required this.remoteRepository});

  Future<Either<Failure, List<NewsUpdateEntity>>> call() async {
    final newsUpdates = await remoteRepository.getNewsUpdate();

    return newsUpdates;
  }
}

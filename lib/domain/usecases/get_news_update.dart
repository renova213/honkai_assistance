import 'package:dartz/dartz.dart';
import 'package:honkai_assistance/common/error/error.dart';
import 'package:honkai_assistance/domain/entities/news_update_entity.dart';
import 'package:honkai_assistance/domain/repositories/home_repository.dart';

class GetNewsUpdate {
  final HomeRepository homeRepository;

  GetNewsUpdate({required this.homeRepository});

  Future<Either<Failure, List<NewsUpdateEntity>>> call() async {
    final newsUpdates = await homeRepository.getNewsUpdates();

    return newsUpdates;
  }
}

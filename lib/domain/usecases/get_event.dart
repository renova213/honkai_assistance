import 'package:dartz/dartz.dart';
import 'package:honkai_assistance/common/error/error.dart';
import 'package:honkai_assistance/domain/entities/event_entity.dart';
import 'package:honkai_assistance/domain/repositories/home_repository.dart';

class GetEvent {
  final HomeRepository homeRepository;

  GetEvent({required this.homeRepository});

  Future<Either<Failure, List<EventEntity>>> call() async {
    final events = await homeRepository.getEvents();

    return events;
  }
}

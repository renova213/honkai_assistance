import 'package:dartz/dartz.dart';
import 'package:honkai_assistance/common/error/error.dart';
import 'package:honkai_assistance/domain/entities/event_entity.dart';
import 'package:honkai_assistance/domain/repositories/remote_repository.dart';

class GetEvent {
  final RemoteRepository remoteRepository;

  GetEvent({required this.remoteRepository});

  Future<Either<Failure, List<EventEntity>>> call() async {
    final events = await remoteRepository.getEvent();

    return events;
  }
}

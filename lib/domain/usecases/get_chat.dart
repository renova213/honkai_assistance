import 'package:dartz/dartz.dart';
import 'package:honkai_assistance/common/error/error.dart';
import 'package:honkai_assistance/domain/entities/chat_entity.dart';
import 'package:honkai_assistance/domain/repositories/remote_repository.dart';

class GetChat {
  final RemoteRepository remoteRepository;

  GetChat({required this.remoteRepository});

  Future<Either<Failure, List<ChatEntity>>> call(
      String userEmail, String otherUserEmail) async {
    final chats = await remoteRepository.getChats(userEmail, otherUserEmail);

    return chats;
  }
}

import 'package:dartz/dartz.dart';
import 'package:honkai_assistance/common/error/error.dart';
import 'package:honkai_assistance/data/models/chat_model.dart';
import 'package:honkai_assistance/domain/repositories/remote_repository.dart';

class GetChat {
  final RemoteRepository remoteRepository;

  GetChat({required this.remoteRepository});

  Future<Either<Failure, List<ChatModel>>> call(
      String userEmail, String otherUserEmail) async {
    final chats = await remoteRepository.getChats(userEmail, otherUserEmail);

    return chats;
  }
}

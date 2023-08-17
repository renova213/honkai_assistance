import 'package:dartz/dartz.dart';
import 'package:honkai_assistance/common/error/failure.dart';
import 'package:honkai_assistance/domain/entities/chat_entity.dart';
import 'package:honkai_assistance/domain/repositories/remote_repository.dart';

class ChatUsecase {
  final RemoteRepository remoteRepository;

  ChatUsecase({required this.remoteRepository});

  Future<Either<Failure, List<ChatEntity>>> getChats(
      String userEmail, String otherUserEmail) async {
    final chats = await remoteRepository.getChats(userEmail, otherUserEmail);

    return chats;
  }

  Future<void> postChat(
      String userEmail, String otherUserEmail, ChatEntity chat) async {
    await remoteRepository.postChat(userEmail, otherUserEmail, chat);
  }
}

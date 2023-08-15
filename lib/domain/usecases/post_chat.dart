import 'package:honkai_assistance/domain/entities/chat_entity.dart';
import 'package:honkai_assistance/domain/repositories/remote_repository.dart';

class PostChat {
  final RemoteRepository remoteRepository;

  PostChat({required this.remoteRepository});

  Future<void> call(
      String userEmail, String otherUserEmail, ChatEntity chat) async {
    await remoteRepository.addChat(userEmail, otherUserEmail, chat);
  }
}

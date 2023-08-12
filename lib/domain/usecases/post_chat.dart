import 'package:honkai_assistance/data/models/chat_model.dart';
import 'package:honkai_assistance/domain/repositories/remote_repository.dart';

class PostChat {
  final RemoteRepository remoteRepository;

  PostChat({required this.remoteRepository});

  Future<void> call(
      String userEmail, String otherUserEmail, ChatModel chat) async {
    await remoteRepository.addChat(userEmail, otherUserEmail, chat);
  }
}

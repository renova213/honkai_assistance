import 'package:flutter/material.dart';
import 'package:honkai_assistance/common/util/enum_state.dart';
import 'package:honkai_assistance/domain/entities/chat_entity.dart';
import 'package:honkai_assistance/domain/usecases/chat_usecase.dart';

class ChatProvider extends ChangeNotifier {
  final ChatUsecase chatUsecase;

  ChatProvider({required this.chatUsecase});

  List<ChatEntity> _chats = [];
  AppState _appState = AppState.loading;
  String _failureMessage = "";

  List<ChatEntity> get chats => _chats;
  String get failureMessage => _failureMessage;
  AppState get appstate => _appState;

  Future<void> getChats(String userEmail, String otherUserEmail) async {
    changeAppState(AppState.loading);

    final failureOrChat = await chatUsecase.getChats(userEmail, otherUserEmail);

    failureOrChat.fold(
      (failure) {
        _failureMessage = failure.message;

        changeAppState(AppState.failed);
      },
      (chats) {
        _chats = chats;
        changeAppState(AppState.loading);
      },
    );
  }

  void sortList() async {
    _chats.sort((a, b) {
      final date = DateTime.parse(a.createdAt);
      final date2 = DateTime.parse(b.createdAt);

      return date.compareTo(date2);
    });
  }

  Future<void> addChat(
      {required String userEmail,
      required String otherUserEmail,
      required ChatEntity chat}) async {
    try {
      await chatUsecase.postChat(userEmail, otherUserEmail, chat);
    } catch (e) {
      rethrow;
    }
  }

  changeAppState(AppState state) {
    _appState = state;
    notifyListeners();
  }
}
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:honkai_assistance/common/style/app_color.dart';
import 'package:honkai_assistance/common/style/font_style.dart';
import 'package:honkai_assistance/data/models/chat_model.dart';
import 'package:honkai_assistance/presentation/components/chat_bubble.dart';
import 'package:honkai_assistance/presentation/provider/auth_provider.dart';
import 'package:honkai_assistance/presentation/provider/chat_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  late Timer pollingTimer;

  @override
  void initState() {
    super.initState();
    _startPollingForMessages();
  }

  void _startPollingForMessages() {
    pollingTimer = Timer.periodic(
      const Duration(seconds: 5),
      (timer) {
        Future.microtask(() async =>
            await Provider.of<ChatProvider>(context, listen: false).getChats(
                Provider.of<AuthProvider>(context, listen: false).emailUser,
                "rizcorenova31@gmail.com"));
      },
    );
  }

  @override
  void dispose() {
    pollingTimer.cancel();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        title: Text("Chat Screen", style: AppFont.largeText),
        centerTitle: true,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            _listChat(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
                child: SizedBox(
                  height: 40.h,
                  child: _inputField(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Consumer _listChat() {
    return Consumer<ChatProvider>(
      builder: (context, chat, _) => Consumer<AuthProvider>(
        builder: (context, auth, _) => Padding(
          padding:
              EdgeInsets.only(bottom: 60.h, left: 20.w, right: 20.w, top: 20.h),
          child: ListView.separated(
              itemBuilder: (context, index) {
                final data = chat.chats[index];
                chat.sortList();
                return Align(
                  alignment: data.senderEmail == auth.emailUser
                      ? Alignment.centerRight
                      : Alignment.bottomLeft,
                  child: ChatBubble(message: data.message, time: data.time),
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 16.h),
              itemCount: chat.chats.length),
        ),
      ),
    );
  }

  Consumer _inputField() {
    final date = DateFormat('dd-MM-yyyy').format(DateTime.now());
    final time = DateFormat('HH:mm:ss').format(DateTime.now());

    return Consumer<AuthProvider>(
      builder: (context, auth, _) => Consumer<ChatProvider>(
        builder: (context, chat, _) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            controller: _messageController,
            onSubmitted: (value) async {
              if (_messageController.text.isNotEmpty) {
                await chat
                    .addChat(
                      userEmail: auth.emailUser,
                      otherUserEmail: "rizcorenova31@gmail.com",
                      chat: ChatModel(
                          createdAt: DateTime.now().toString(),
                          senderEmail: auth.emailUser,
                          message: _messageController.text,
                          receiverEmail: "rizcorenova31@gmail.com",
                          time: time,
                          date: date),
                    )
                    .then(
                      (_) => setState(() => _messageController.clear()),
                    );
              }
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              hintText: 'Type a message...',
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: const BorderSide(color: AppColor.blue),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: const BorderSide(color: AppColor.blue),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: const BorderSide(color: AppColor.blue),
              ),
              suffixIcon: IconButton(
                icon: const Icon(Icons.send, color: AppColor.blue),
                onPressed: () async {
                  if (_messageController.text.isNotEmpty) {}
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

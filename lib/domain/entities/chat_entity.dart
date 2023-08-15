import 'package:equatable/equatable.dart';
import 'package:honkai_assistance/data/models/chat_model.dart';

class ChatEntity extends Equatable {
  final String id;
  final String receiverEmail;
  final String senderEmail;
  final String message;
  final String date;
  final String time;
  final String createdAt;

  const ChatEntity(
      {required this.senderEmail,
      required this.message,
      required this.receiverEmail,
      required this.time,
      required this.id,
      required this.createdAt,
      required this.date});

  ChatModel toChatModel() => ChatModel(
      senderEmail: senderEmail,
      message: message,
      receiverEmail: receiverEmail,
      time: time,
      id: id,
      createdAt: createdAt,
      date: date);

  @override
  List<Object> get props =>
      [id, receiverEmail, senderEmail, message, date, time, createdAt];
}

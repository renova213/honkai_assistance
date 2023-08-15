import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:honkai_assistance/domain/entities/chat_entity.dart';

class ChatModel extends ChatEntity {
  const ChatModel(
      {required super.senderEmail,
      required super.message,
      required super.receiverEmail,
      required super.time,
      required super.id,
      required super.createdAt,
      required super.date});

  factory ChatModel.fromDoc(DocumentSnapshot doc) => ChatModel(
      date: (doc.data() as Map)['date'],
      time: (doc.data() as Map)['time'],
      createdAt: (doc.data() as Map)['createdAt'],
      senderEmail: (doc.data() as Map)['senderEmail'],
      receiverEmail: (doc.data() as Map)['receiverEmail'],
      message: (doc.data() as Map)['message'],
      id: doc.id);

  Map<String, dynamic> toJson() => {
        'date': date,
        'senderEmail': senderEmail,
        'receiverEmail': receiverEmail,
        'message': message,
        'createdAt': createdAt,
        'time': time,
      };
}

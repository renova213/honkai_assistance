import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  String? id;
  final String receiverEmail;
  final String senderEmail;
  final String message;
  final String date;
  final String time;

  ChatModel(
      {required this.senderEmail,
      required this.message,
      required this.receiverEmail,
      required this.time,
      this.id,
      required this.date});

  factory ChatModel.fromDoc(DocumentSnapshot doc) => ChatModel(
      date: (doc.data() as Map)['date'],
      time: (doc.data() as Map)['time'],
      senderEmail: (doc.data() as Map)['senderEmail'],
      receiverEmail: (doc.data() as Map)['receiverEmail'],
      message: (doc.data() as Map)['message'],
      id: doc.id);

  Map<String, dynamic> toJson() => {
        'date': date,
        'senderEmail': senderEmail,
        'receiverEmail': receiverEmail,
        'message': message,
        'time': time
      };
}

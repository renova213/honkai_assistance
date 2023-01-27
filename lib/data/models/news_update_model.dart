import 'package:cloud_firestore/cloud_firestore.dart';

class NewsUpdateModel {
  final String? id;
  final String urlImage;
  final String title;
  final String date;
  final String description;

  NewsUpdateModel(
      {required this.urlImage,
      required this.title,
      required this.date,
      required this.description,
      this.id});

  factory NewsUpdateModel.fromDoc(DocumentSnapshot doc) => NewsUpdateModel(
      urlImage: (doc.data() as Map)['urlImage'],
      date: (doc.data() as Map)['date'],
      title: (doc.data() as Map)['title'],
      description: (doc.data() as Map)['description'],
      id: doc.id);

  Map<String, dynamic> toJson() => {
        'urlImage': urlImage,
        'title': title,
        'description': description,
        'date': date
      };
}

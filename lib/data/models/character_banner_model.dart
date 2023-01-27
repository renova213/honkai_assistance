import 'package:cloud_firestore/cloud_firestore.dart';

class CharacterBannerModel {
  final String? id;
  final String urlImage;
  final String title;
  final String endDate;

  CharacterBannerModel(
      {required this.urlImage,
      required this.title,
      required this.endDate,
      this.id});

  factory CharacterBannerModel.fromDoc(DocumentSnapshot doc) =>
      CharacterBannerModel(
          id: doc.id,
          urlImage: (doc.data() as Map)['urlImage'],
          title: (doc.data() as Map)['title'],
          endDate: (doc.data() as Map)['endDate']);

  Map<String, dynamic> toJson() =>
      {'urlImage': urlImage, 'title': title, 'endDate': endDate};
}

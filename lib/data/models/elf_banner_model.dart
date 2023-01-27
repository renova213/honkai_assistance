import 'package:cloud_firestore/cloud_firestore.dart';

class ElfBannerModel {
  final String? id;
  final String urlImage;
  final String title;
  final String endDate;

  ElfBannerModel(
      {required this.urlImage,
      required this.title,
      required this.endDate,
      this.id});

  factory ElfBannerModel.fromDoc(DocumentSnapshot doc) => ElfBannerModel(
      id: doc.id,
      urlImage: (doc.data() as Map)['urlImage'],
      title: (doc.data() as Map)['title'],
      endDate: (doc.data() as Map)['endDate']);

  Map<String, dynamic> toJson() =>
      {'urlImage': urlImage, 'title': title, 'endDate': endDate};
}

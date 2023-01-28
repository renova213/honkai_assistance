import 'package:honkai_assistance/domain/entities/news_update_entity.dart';

class NewsUpdateModel extends NewsUpdateEntity {
  const NewsUpdateModel(
      {required super.urlWeb,
      required super.date,
      required super.title,
      required super.description,
      required super.urlImage});

  factory NewsUpdateModel.fromMap(Map<String, dynamic> map) => NewsUpdateModel(
        urlImage: map['urlImage'],
        urlWeb: map['urlWeb'],
        date: map['date'],
        title: map['title'],
        description: map['description'],
      );
}

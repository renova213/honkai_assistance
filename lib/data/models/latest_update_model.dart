import 'package:honkai_lab/domain/entities/latest_update.dart';

class LatestUpdateModel extends LatestUpdate {
  const LatestUpdateModel(
      {required super.urlWeb,
      required super.title,
      required super.description,
      required super.urlImage});

  factory LatestUpdateModel.fromMap(Map<String, dynamic> json) =>
      LatestUpdateModel(
        urlWeb: json['urlWeb'],
        title: json['title'],
        description: json['description'],
        urlImage: json['urlImage'],
      );
}

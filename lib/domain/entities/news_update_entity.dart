import 'package:equatable/equatable.dart';

class NewsUpdateEntity extends Equatable {
  final String urlWeb;
  final String date;
  final String title;
  final String description;
  final String urlImage;

  const NewsUpdateEntity(
      {required this.urlWeb,
      required this.date,
      required this.title,
      required this.description,
      required this.urlImage});
  @override
  List<Object?> get props => [urlImage, urlWeb, title, description, date];
}

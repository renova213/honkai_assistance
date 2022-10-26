import 'package:equatable/equatable.dart';

class LatestUpdate extends Equatable {
  final String urlWeb;
  final String title;
  final String description;
  final String urlImage;

  const LatestUpdate(
      {required this.urlWeb,
      required this.title,
      required this.description,
      required this.urlImage});
  @override
  List<Object?> get props => [urlImage, urlWeb, title, description];
}

import 'package:equatable/equatable.dart';

class Update extends Equatable {
  final String urlWeb;
  final String title;
  final String description;
  final String urlImage;

  const Update(
      {required this.urlWeb,
      required this.title,
      required this.description,
      required this.urlImage});
  @override
  List<Object?> get props => [urlImage, urlWeb, title, description];
}

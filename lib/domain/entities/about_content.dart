import 'package:equatable/equatable.dart';

class AboutContent extends Equatable {
  final String title;
  final String assetImage;
  final String description;

  const AboutContent(
      {required this.title,
      required this.assetImage,
      required this.description});
  @override
  List<Object?> get props => [];
}

import 'package:equatable/equatable.dart';

class EventHonkai extends Equatable {
  final String title;
  final String description;
  final String urlImage;
  final String eventType;

  const EventHonkai(
      {required this.title,
      required this.description,
      required this.urlImage,
      required this.eventType});

  @override
  List<Object> get props => [title, description, urlImage, eventType];
}

import 'package:equatable/equatable.dart';

class EventHonkai extends Equatable {
  final String title;
  final String description;
  final String urlImage;

  const EventHonkai(
      {required this.title, required this.description, required this.urlImage});

  @override
  List<Object> get props => [title, description, urlImage];
}

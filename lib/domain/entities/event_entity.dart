import 'package:equatable/equatable.dart';

class EventEntity extends Equatable {
  final String urlImage;
  final String title;
  final String endDate;

  const EventEntity(
      {required this.urlImage, required this.title, required this.endDate});

  @override
  List<Object> get props => [urlImage, title, endDate];
}

import '../../domain/entities/event_entity.dart';

class EventModel extends EventEntity {
  const EventModel(
      {required super.urlImage, required super.title, required super.endDate});

  factory EventModel.fromMap(Map<String, dynamic> map) => EventModel(
      urlImage: map['urlImage'], title: map['title'], endDate: map['endDate']);
}

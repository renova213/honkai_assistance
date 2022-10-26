import 'package:honkai_lab/domain/entities/event_honkai.dart';

class EventHonkaiModel extends EventHonkai {
  const EventHonkaiModel(
      {required super.title,
      required super.description,
      required super.urlImage,
      required super.eventType});

  factory EventHonkaiModel.fromMap(Map<String, dynamic> json) =>
      EventHonkaiModel(
        title: json['title'],
        description: json['description'],
        urlImage: json['urlImage'],
        eventType: json['eventType'],
      );
}

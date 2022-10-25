part of 'event_honkai_bloc.dart';

abstract class EventHonkaiEvent extends Equatable {
  const EventHonkaiEvent();

  @override
  List<Object> get props => [];
}

class FetchEventHonkai extends EventHonkaiEvent {}

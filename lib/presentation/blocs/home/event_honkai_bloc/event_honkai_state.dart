part of 'event_honkai_bloc.dart';

abstract class EventHonkaiState extends Equatable {
  const EventHonkaiState();

  @override
  List<Object> get props => [];
}

class EmptyEventHonkai extends EventHonkaiState {}

class LoadingEventHonkai extends EventHonkaiState {}

class EventHonkaiLoaded extends EventHonkaiState {
  final List<EventHonkai> currentEvents;
  final List<EventHonkai> upcomingEvents;

  const EventHonkaiLoaded(
      {this.currentEvents = const [], this.upcomingEvents = const []});
  @override
  List<Object> get props => [currentEvents, upcomingEvents];
}

class ErrorEventHonkai extends EventHonkaiState {
  final String errorMessage;

  const ErrorEventHonkai({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

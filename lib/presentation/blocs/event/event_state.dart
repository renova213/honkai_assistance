part of 'event_bloc.dart';

abstract class EventState extends Equatable {
  const EventState();

  @override
  List<Object> get props => [];
}

class EmptyEventState extends EventState {}

class LoadingEventState extends EventState {}

class LoadedEventState extends EventState {
  final List<EventEntity> events;

  const LoadedEventState({required this.events});

  @override
  List<Object> get props => [events];
}

class ErrorEventState extends EventState {
  final String message;
  const ErrorEventState({required this.message});

  @override
  List<Object> get props => [message];
}

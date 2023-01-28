import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:honkai_assistance/domain/usecases/get_event.dart';

import '../../../domain/entities/event_entity.dart';

part 'event_event.dart';
part 'event_state.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  final GetEvent getEvent;
  EventBloc({required this.getEvent}) : super(EmptyEventState()) {
    on<GetEventEvent>((event, emit) async {
      emit(LoadingEventState());

      final failureOrEvent = await getEvent.call();

      failureOrEvent.fold(
        (failure) => emit(ErrorEventState(message: failure.message)),
        (events) => emit(LoadedEventState(events: events)),
      );
    });
  }
}

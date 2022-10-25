import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/errors/failure.dart';
import '../../../../domain/entities/event_honkai.dart';
import '../../../../domain/usecases/get_event_honkai.dart';

part 'event_honkai_event.dart';
part 'event_honkai_state.dart';

class EventHonkaiBloc extends Bloc<EventHonkaiEvent, EventHonkaiState> {
  final GetEventHonkai getEventHonkai;
  EventHonkaiBloc({required this.getEventHonkai}) : super(EmptyEventHonkai()) {
    on<FetchEventHonkai>((event, emit) async {
      emit(
        LoadingEventHonkai(),
      );
      final failureOrEventHonkai = await getEventHonkai("event");

      failureOrEventHonkai.fold(
          (failure) => emit(
                ErrorEventHonkai(
                  errorMessage: _mapFailureOrMessage(failure),
                ),
              ), (eventHonkai) {
        List<EventHonkai> currentEvent = [];
        List<EventHonkai> upcomingEvent = [];

        for (var i in eventHonkai) {
          if (i.eventType.toLowerCase() == "current" &&
              !currentEvent.contains(i)) {
            currentEvent.add(i);
          }
          if (i.eventType.toLowerCase() == "upcoming" &&
              !upcomingEvent.contains(i)) {
            upcomingEvent.add(i);
          }
          emit(EventHonkaiLoaded(
              currentEvents: currentEvent, upcomingEvents: upcomingEvent));
        }
      });
    });
  }

  String _mapFailureOrMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'ServerFailure';
      default:
        return 'Unexpected Error';
    }
  }
}

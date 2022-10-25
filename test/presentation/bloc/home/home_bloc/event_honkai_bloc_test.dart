import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_lab/common/errors/failure.dart';
import 'package:honkai_lab/domain/entities/event_honkai.dart';
import 'package:honkai_lab/domain/usecases/get_event_honkai.dart';
import 'package:honkai_lab/presentation/blocs/home/event_honkai_bloc/event_honkai_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'event_honkai_bloc_test.mocks.dart';

@GenerateMocks([GetEventHonkai])
void main() {
  MockGetEventHonkai mockGetEventHonkai = MockGetEventHonkai();

  EventHonkaiBloc bloc = EventHonkaiBloc(getEventHonkai: mockGetEventHonkai);

  const testEventHonkai = EventHonkai(
      title: "title",
      description: "description",
      urlImage: "urlImage",
      eventType: "eventType");

  group('FetchEventHonkai', () {
    test('should get data from the GetEventHonkai usecase', () async {
      when(mockGetEventHonkai(any))
          .thenAnswer((_) async => const Right([testEventHonkai]));

      bloc.add(FetchEventHonkai());
      await untilCalled(mockGetEventHonkai("event"));

      verify(mockGetEventHonkai("event"));
    });

    test('should emit [Loading, Loaded] when data is gotten successfully',
        () async {
      when(mockGetEventHonkai(any))
          .thenAnswer((_) async => const Right([testEventHonkai]));

      expectLater(
          bloc.stream,
          emitsInOrder([
            LoadingEventHonkai(),
            const EventHonkaiLoaded(currentEvents: [], upcomingEvents: [])
          ]));

      bloc.add(FetchEventHonkai());
    });

    test('should emit [Loading, Failure] when data is gotten successfully',
        () async {
      when(mockGetEventHonkai(any)).thenAnswer(
          (_) async => const Left(ServerFailure(message: 'ServerFailure')));

      expectLater(
          bloc.stream,
          emitsInOrder([
            LoadingEventHonkai(),
            const ErrorEventHonkai(errorMessage: "ServerFailure")
          ]));

      bloc.add(FetchEventHonkai());
    });
  });
}

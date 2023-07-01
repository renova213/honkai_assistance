import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:honkai_assistance/common/constant.dart';
import 'package:honkai_assistance/common/error/error.dart';
import 'package:honkai_assistance/common/util/utils.dart';
import 'package:honkai_assistance/domain/entities/event_entity.dart';
import 'package:honkai_assistance/domain/usecases/get_event.dart';
import 'package:honkai_assistance/presentation/provider/event_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'event_provider_test.mocks.dart';

@GenerateMocks([GetEvent])
void main() {
  const testEventEntity =
      EventEntity(urlImage: "string", title: "string", endDate: "string");

  group('EventProvider', () {
    MockGetEvent usecase = MockGetEvent();
    EventProvider provider = EventProvider(getEvent: usecase);

    test(
        'should update app state and EventEntity list on successful data retrieval',
        () async {
      when(usecase.call()).thenAnswer(
        (_) async => const Right([testEventEntity]),
      );

      await provider.getEvents();

      expect(provider.appstate, AppState.loaded);
      expect(provider.events.length, 1);
    });

    test('should update app state and failureMessage on failed data retrieval',
        () async {
      when(usecase.call()).thenAnswer(
        (_) async => const Left(InternetFailure(message: internetError)),
      );

      await provider.getEvents();

      expect(provider.appstate, AppState.failed);
      expect(provider.failureMessage, internetError);
    });
  });
}

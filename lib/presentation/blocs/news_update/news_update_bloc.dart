import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:honkai_assistance/domain/entities/news_update_entity.dart';
import 'package:honkai_assistance/domain/usecases/get_news_update.dart';

part 'news_update_event.dart';
part 'news_update_state.dart';

class NewsUpdateBloc extends Bloc<NewsUpdateEvent, NewsUpdateState> {
  final GetNewsUpdate getNewsUpdate;
  NewsUpdateBloc({required this.getNewsUpdate})
      : super(EmptyNewsUpdateState()) {
    on<GetNewsUpdateEvent>(
      (event, emit) async {
        emit(LoadingNewsUpdateState());

        final failureOrNewsUpdate = await getNewsUpdate.call();

        failureOrNewsUpdate.fold(
          (failure) => emit(ErrorNewsUpdateState(message: failure.message)),
          (newsUpdates) =>
              emit(LoadedNewsUpdateState(newsUpdates: newsUpdates)),
        );
      },
    );
  }
}

part of 'news_update_bloc.dart';

abstract class NewsUpdateState extends Equatable {
  const NewsUpdateState();

  @override
  List<Object> get props => [];
}

class EmptyNewsUpdateState extends NewsUpdateState {}

class LoadingNewsUpdateState extends NewsUpdateState {}

class LoadedNewsUpdateState extends NewsUpdateState {
  final List<NewsUpdateEntity> newsUpdates;

  const LoadedNewsUpdateState({required this.newsUpdates});

  @override
  List<Object> get props => [newsUpdates];
}

class ErrorNewsUpdateState extends NewsUpdateState {
  final String message;
  const ErrorNewsUpdateState({required this.message});

  @override
  List<Object> get props => [message];
}

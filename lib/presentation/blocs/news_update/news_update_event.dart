part of 'news_update_bloc.dart';

abstract class NewsUpdateEvent extends Equatable {
  const NewsUpdateEvent();

  @override
  List<Object> get props => [];
}

class GetNewsUpdateEvent extends NewsUpdateEvent {}

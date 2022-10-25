part of 'changelog_bloc.dart';

abstract class ChangelogEvent extends Equatable {
  const ChangelogEvent();

  @override
  List<Object> get props => [];
}

class FetchChangelog extends ChangelogEvent {}

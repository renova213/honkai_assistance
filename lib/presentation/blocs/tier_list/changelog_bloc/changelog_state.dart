part of 'changelog_bloc.dart';

abstract class ChangelogState extends Equatable {
  const ChangelogState();

  @override
  List<Object> get props => [];
}

class EmptyChangelog extends ChangelogState {}

class LoadingChangelog extends ChangelogState {}

class LoadedChangelog extends ChangelogState {
  final Changelog changelogs;

  const LoadedChangelog({required this.changelogs});
  @override
  List<Object> get props => [changelogs];
}

class ErrorChangelog extends ChangelogState {
  final String errorMessage;

  const ErrorChangelog({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

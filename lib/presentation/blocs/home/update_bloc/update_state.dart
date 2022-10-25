part of 'update_bloc.dart';

abstract class UpdateState extends Equatable {
  const UpdateState();

  @override
  List<Object> get props => [];
}

class UpdateEmpty extends UpdateState {}

class UpdateLoading extends UpdateState {}

class UpdateLoaded extends UpdateState {
  final List<LatestUpdate> listUpdates;

  const UpdateLoaded({this.listUpdates = const []});
  @override
  List<Object> get props => [listUpdates];
}

class UpdateError extends UpdateState {
  final String errorMessage;

  const UpdateError({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

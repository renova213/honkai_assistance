import 'package:equatable/equatable.dart';

class RankUpLevel extends Equatable {
  final String rankUp;
  final String description;

  const RankUpLevel({required this.rankUp, required this.description});
  @override
  List<Object> get props => [rankUp, description];
}

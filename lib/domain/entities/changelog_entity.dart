import 'package:equatable/equatable.dart';

class ChangelogEntity extends Equatable {
  final String image;
  final String name;
  final String tierBefore;
  final String tierAfter;

  const ChangelogEntity(
      {required this.image,
      required this.name,
      required this.tierAfter,
      required this.tierBefore});

  @override
  List<Object> get props => [image, name, tierBefore, tierAfter];
}

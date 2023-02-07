import 'package:equatable/equatable.dart';

class TierListEntity extends Equatable {
  final String valkyrieName;
  final String image;
  final String tier;
  final String role;
  final String element;

  const TierListEntity(
      {required this.valkyrieName,
      required this.image,
      required this.element,
      required this.role,
      required this.tier});

  @override
  List<Object> get props => [valkyrieName, image, tier, role, element];
}

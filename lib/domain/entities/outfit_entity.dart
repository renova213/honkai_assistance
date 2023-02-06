import 'package:equatable/equatable.dart';

class OutfitEntity extends Equatable {
  final String outfitName;
  final String outfitImage;
  final String outfitIcon;
  final String grade;

  const OutfitEntity(
      {required this.outfitName,
      required this.outfitImage,
      required this.outfitIcon,
      required this.grade});

  @override
  List<Object> get props => [outfitName, outfitImage, grade, outfitIcon];
}

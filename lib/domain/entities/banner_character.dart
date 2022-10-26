import 'package:equatable/equatable.dart';

class BannerCharacter extends Equatable {
  final String urlImage;
  final String nameCharacter;
  final String endDate;

  const BannerCharacter(
      {required this.urlImage,
      required this.endDate,
      required this.nameCharacter});
  @override
  List<Object?> get props => [urlImage, nameCharacter, endDate];
}

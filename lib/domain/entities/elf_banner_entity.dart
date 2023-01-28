import 'package:equatable/equatable.dart';

class ElfBannerEntity extends Equatable {
  final String urlImage;
  final String title;
  final String endDate;

  const ElfBannerEntity({
    required this.urlImage,
    required this.title,
    required this.endDate,
  });

  @override
  List<Object?> get props => [urlImage, title, endDate];
}

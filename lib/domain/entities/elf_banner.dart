import 'package:equatable/equatable.dart';

class ElfBanner extends Equatable {
  final String urlImage;
  final String nameElf;
  final String endDate;

  const ElfBanner(
      {required this.urlImage, required this.endDate, required this.nameElf});
  @override
  List<Object?> get props => [urlImage, nameElf, endDate];
}

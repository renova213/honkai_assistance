import 'package:honkai_lab/domain/entities/elf_banner.dart';

class ElfBannerModel extends ElfBanner {
  const ElfBannerModel(
      {required super.urlImage,
      required super.endDate,
      required super.nameElf});

  factory ElfBannerModel.fromMap(Map<String, dynamic> json) => ElfBannerModel(
        urlImage: json['urlImage'],
        endDate: json['endDate'],
        nameElf: json['nameElf'],
      );
}

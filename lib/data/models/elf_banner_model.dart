import 'package:honkai_assistance/domain/entities/elf_banner_entity.dart';

class ElfBannerModel extends ElfBannerEntity {
  const ElfBannerModel(
      {required super.urlImage, required super.title, required super.endDate});
  factory ElfBannerModel.fromMap(Map<String, dynamic> map) => ElfBannerModel(
      urlImage: map['urlImage'], title: map['title'], endDate: map['endDate']);
}

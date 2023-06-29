import 'package:honkai_assistance/domain/entities/guide_entity.dart';

class GuideModel extends GuideEntity {
  const GuideModel(
      {required super.titleGuide,
      required super.urlImage,
      required super.descriptionGuide,
      super.guideItems});

  factory GuideModel.fromMap(Map<String, dynamic> map) => GuideModel(
      titleGuide: map['titleGuide'],
      urlImage: map['urlImage'],
      descriptionGuide: map['descriptionGuide'],
      guideItems: map['guideItems'] != null
          ? (map['guideItems'] as List)
              .map((e) => GuideItemModel.fromMap(e))
              .toList()
          : []);
}

class GuideItemModel extends GuideItemEntity {
  const GuideItemModel({super.title, super.guideDetails});

  factory GuideItemModel.fromMap(Map<String, dynamic> map) => GuideItemModel(
      title: map['title'] ?? 'null',
      guideDetails: map['guideDetails'] != null
          ? (map['guideDetails'] as List)
              .map((e) => GuideItemDetailModel.fromMap(e))
              .toList()
          : []);
}

class GuideItemDetailModel extends GuideItemDetailEntity {
  const GuideItemDetailModel(
      {required super.description, super.image, super.subtitle});

  factory GuideItemDetailModel.fromMap(Map<String, dynamic> map) =>
      GuideItemDetailModel(
          subtitle: map['subtitle'] ?? '',
          image: map['image'] ?? '',
          description: map['description']);
}

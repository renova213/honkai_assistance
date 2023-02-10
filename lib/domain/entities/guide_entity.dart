import 'package:equatable/equatable.dart';

class GuideEntity extends Equatable {
  final String titleGuide;
  final String urlImage;
  final String descriptionGuide;
  final List<GuideItemEntity>? guideItems;
  const GuideEntity(
      {required this.titleGuide,
      required this.urlImage,
      required this.descriptionGuide,
      this.guideItems});

  @override
  List<Object> get props =>
      [titleGuide, urlImage, descriptionGuide, guideItems!];
}

class GuideItemEntity extends Equatable {
  final String? title;
  final List<GuideDetailEntity>? guideDetails;
  const GuideItemEntity({this.title, this.guideDetails});

  @override
  List<Object> get props => [title!, guideDetails!];
}

class GuideDetailEntity extends Equatable {
  final String? subtitle;
  final String? image;
  final String description;
  const GuideDetailEntity(
      {this.subtitle, this.image, required this.description});
  @override
  List<Object> get props => [subtitle!, image!, description];
}

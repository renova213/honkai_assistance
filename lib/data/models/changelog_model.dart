import 'package:honkai_assistance/domain/entities/changelog_entity.dart';

class ChangelogModel extends ChangelogEntity {
  const ChangelogModel(
      {required super.image,
      required super.name,
      required super.tierAfter,
      required super.tierBefore});

  factory ChangelogModel.fromMap(Map<String, dynamic> map) => ChangelogModel(
      image: map['image'],
      name: map['name'],
      tierAfter: map['tierAfter'],
      tierBefore: map['tierBefore']);
}

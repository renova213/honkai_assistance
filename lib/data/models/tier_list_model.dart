import 'package:honkai_assistance/domain/entities/tier_list_entity.dart';

class TierListModel extends TierListEntity {
  const TierListModel(
      {required super.valkyrieName,
      required super.image,
      required super.element,
      required super.role,
      required super.tier});

  factory TierListModel.fromMap(Map<String, dynamic> map) => TierListModel(
      valkyrieName: map['valkyrieName'],
      image: map['image'],
      role: map['role'],
      element: map['element'],
      tier: map['tier']);
}

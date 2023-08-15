import 'package:honkai_assistance/domain/entities/top_up_entity.dart';

class TopUpModel extends TopUpEntity {
  const TopUpModel(
      {required super.categoryName,
      required super.imageAsset,
      required super.topUpItems});
}

class TopUpItemModel extends TopUpItemEntity {
  const TopUpItemModel(
      {required super.itemName,
      required super.imageAsset,
      required super.price});
}

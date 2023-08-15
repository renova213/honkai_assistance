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

  factory TopUpItemModel.fromMap(Map<String, dynamic> map) => TopUpItemModel(
      itemName: map['itemName'],
      imageAsset: map['imageAsset'],
      price: map['price']);

  Map<String, dynamic> toJson() =>
      {'itemName': itemName, 'imageAsset': imageAsset, 'price': price};
}

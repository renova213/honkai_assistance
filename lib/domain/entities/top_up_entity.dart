import 'package:equatable/equatable.dart';
import 'package:honkai_assistance/data/models/topup_item_model.dart';

class TopUpEntity extends Equatable {
  final String categoryName;
  final String imageAsset;
  final List<TopUpItemEntity> topUpItems;

  const TopUpEntity(
      {required this.categoryName,
      required this.imageAsset,
      required this.topUpItems});

  @override
  List<Object> get props => [categoryName, imageAsset];
}

class TopUpItemEntity extends Equatable {
  final String itemName;
  final String imageAsset;
  final int price;

  const TopUpItemEntity(
      {required this.itemName, required this.imageAsset, required this.price});

  TopUpItemModel toModel() =>
      TopUpItemModel(itemName: itemName, imageAsset: imageAsset, price: price);

  @override
  List<Object> get props => [itemName, imageAsset, price];
}

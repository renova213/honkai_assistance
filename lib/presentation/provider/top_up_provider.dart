import 'package:flutter/material.dart';
import 'package:honkai_assistance/common/util/enum_state.dart';
import 'package:honkai_assistance/domain/entities/payment_entity.dart';
import 'package:honkai_assistance/domain/entities/top_up_entity.dart';

class TopUpProvider extends ChangeNotifier {
  final List<TopUpEntity> _topUps = const [
    TopUpEntity(
      categoryName: "Monthly Card",
      imageAsset: "assets/images/monthly.png",
      topUpItems: [
        TopUpItemEntity(
            itemName: "Monthly-Card",
            imageAsset: "assets/images/monthly.png",
            price: 84537)
      ],
    ),
    TopUpEntity(
      categoryName: "B Chips",
      imageAsset: "assets/images/bchip.png",
      topUpItems: [
        TopUpItemEntity(
            itemName: "65 B-Chips",
            imageAsset: "assets/images/bchip.png",
            price: 16613),
        TopUpItemEntity(
            itemName: "330 B-Chips",
            imageAsset: "assets/images/bchip.png",
            price: 84573),
        TopUpItemEntity(
            itemName: "990 B-Chips",
            imageAsset: "assets/images/bchip.png",
            price: 229805),
        TopUpItemEntity(
            itemName: "1320 B-Chips",
            imageAsset: "assets/images/bchip.png",
            price: 307329),
        TopUpItemEntity(
            itemName: "1980 B-Chips",
            imageAsset: "assets/images/bchip.png",
            price: 462378),
        TopUpItemEntity(
            itemName: "3300 B-Chips",
            imageAsset: "assets/images/bchip.png",
            price: 775243),
      ],
    ),
    TopUpEntity(
      categoryName: "Crystals",
      imageAsset: "assets/images/crystal.png",
      topUpItems: [
        TopUpItemEntity(
            itemName: "65 Crystals",
            imageAsset: "assets/images/crystal.png",
            price: 16613),
        TopUpItemEntity(
            itemName: "330 Crystals",
            imageAsset: "assets/images/crystal.png",
            price: 84573),
        TopUpItemEntity(
            itemName: "710 Crystals",
            imageAsset: "assets/images/crystal.png",
            price: 155050),
        TopUpItemEntity(
            itemName: "1430 Crystals",
            imageAsset: "assets/images/crystal.png",
            price: 307329),
        TopUpItemEntity(
            itemName: "3860 Crystals",
            imageAsset: "assets/images/crystal.png",
            price: 845720),
      ],
    ),
  ];

  final List<PaymentEntity> _bankPayments = const [
    PaymentEntity(
        bankName: "BCA",
        bankAssetImage: "assets/images/bca.png",
        accountNumber: 3161523721,
        paymentFee: 2500),
    PaymentEntity(
        bankName: "Mandiri",
        bankAssetImage: "assets/images/mandiri.png",
        accountNumber: 1410013032123,
        paymentFee: 2500),
    PaymentEntity(
        bankName: "BNI",
        accountNumber: 0223383830,
        bankAssetImage: "assets/images/bni.png",
        paymentFee: 2500),
    PaymentEntity(
        bankName: "BRI",
        accountNumber: 763201007520530,
        bankAssetImage: "assets/images/bri.png",
        paymentFee: 4000),
  ];
  int _categoryIndex = 0;
  int _itemIndex = 0;
  int _paymentMethodIndex = 0;
  int _selectedPrice = 0;
  int _paymentFee = 0;
  int _userId = 0;
  AppState _itemIndexState = AppState.loaded;

  List<TopUpEntity> get topUps => _topUps;
  List<PaymentEntity> get bankPayments => _bankPayments;
  int get categoryIndex => _categoryIndex;
  int get itemIndex => _itemIndex;
  int get paymentMethodIndex => _paymentMethodIndex;
  int get selectedPrice => _selectedPrice;
  int get paymentFee => _paymentFee;
  int get userId => _userId;
  AppState get itemIndexState => _itemIndexState;

  void changeCategoryIndex(int index) {
    _categoryIndex = index;
    notifyListeners();
  }

  void changeItemIndex(int index, int price) {
    _itemIndex = index;
    _selectedPrice = price;
    notifyListeners();
  }

  void changePaymentMethodIndex(int index, int paymentFee) {
    _paymentMethodIndex = index;
    _paymentFee = paymentFee;
    notifyListeners();
  }

  void changeUserId(int userId) {
    _userId = userId;
    notifyListeners();
  }

  void changeItemIndexState() async {
    _itemIndexState = AppState.loading;
    await Future.delayed(const Duration(seconds: 1));
    _itemIndexState = AppState.loaded;
    notifyListeners();
  }
}

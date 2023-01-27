import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:honkai_assistance/data/models/redeem_code_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<RedeemCodeModel>> getRedeemCodes(String collectionName);
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final FirebaseFirestore firestoreService;
  HomeRemoteDataSourceImpl({required this.firestoreService});
  @override
  Future<List<RedeemCodeModel>> getRedeemCodes(String collectionName) async {
    List<RedeemCodeModel> redeemCodes = [];
    await firestoreService.collection(collectionName).get().then(
      (value) {
        for (var i in value.docs) {
          redeemCodes.add(RedeemCodeModel.fromDoc(i));
        }
      },
    );
    return redeemCodes;
  }
}

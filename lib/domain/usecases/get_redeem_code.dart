import 'package:dartz/dartz.dart';
import 'package:honkai_assistance/domain/entities/redeem_code.dart';
import 'package:honkai_assistance/domain/repositories/home_repository.dart';

import '../../common/error/error.dart';

class GetRedeemCode {
  final HomeRepository homeRepository;

  GetRedeemCode({required this.homeRepository});

  Future<Either<Failure, List<RedeemCode>>> call(String collectionName) async {
    Either<Failure, List<RedeemCode>> redeemCodes =
        await homeRepository.getRedeemCodes(collectionName);

    return redeemCodes;
  }
}

import 'package:dartz/dartz.dart';
import 'package:honkai_assistance/domain/entities/redeem_code_entity.dart';
import 'package:honkai_assistance/domain/repositories/home_repository.dart';

import '../../common/error/error.dart';

class GetRedeemCode {
  final HomeRepository homeRepository;

  GetRedeemCode({required this.homeRepository});

  Future<Either<Failure, List<RedeemCodeEntity>>> call() async {
    Either<Failure, List<RedeemCodeEntity>> redeemCodes =
        await homeRepository.getRedeemCodes();

    return redeemCodes;
  }
}

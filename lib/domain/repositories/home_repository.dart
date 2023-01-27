import 'package:dartz/dartz.dart';

import '../../common/error/error.dart';
import '../entities/redeem_code_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<RedeemCodeEntity>>> getRedeemCodes(
      String collectionName);
}

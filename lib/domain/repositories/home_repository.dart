import 'package:dartz/dartz.dart';

import '../../common/error/error.dart';
import '../entities/redeem_code.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<RedeemCode>>> getRedeemCodes(
      String collectionName);
}

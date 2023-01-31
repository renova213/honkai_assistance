import 'package:dartz/dartz.dart';
import 'package:honkai_assistance/domain/entities/redeem_code_entity.dart';
import 'package:honkai_assistance/domain/repositories/remote_repository.dart';

import '../../common/error/error.dart';

class GetRedeemCode {
  final RemoteRepository remoteRepository;

  GetRedeemCode({required this.remoteRepository});

  Future<Either<Failure, List<RedeemCodeEntity>>> call() async {
    Either<Failure, List<RedeemCodeEntity>> redeemCodes =
        await remoteRepository.getRedeemCodes();

    return redeemCodes;
  }
}

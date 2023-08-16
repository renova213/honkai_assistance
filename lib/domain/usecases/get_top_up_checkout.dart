import 'package:dartz/dartz.dart';
import 'package:honkai_assistance/domain/entities/topup_checkout_entity.dart';
import 'package:honkai_assistance/domain/repositories/remote_repository.dart';

import '../../../common/error/failure.dart';

class GetTopUpCheckout {
  final RemoteRepository remoteRepository;

  GetTopUpCheckout({required this.remoteRepository});

  Future<Either<Failure, List<TopUpCheckoutEntity>>> getTopUpCheckout(
      String emailUser) async {
    Either<Failure, List<TopUpCheckoutEntity>> topUpCheckouts =
        await remoteRepository.getTopUpCheckout(emailUser);

    return topUpCheckouts;
  }

  Future<Either<Failure, TopUpCheckoutEntity>> getTopUpCheckoutByInvoiceId(
      String userEmail, String invoiceId) async {
    Either<Failure, TopUpCheckoutEntity> topUpCheckout = await remoteRepository
        .getTopUpCheckoutByInvoiceId(userEmail, invoiceId);

    return topUpCheckout;
  }
}

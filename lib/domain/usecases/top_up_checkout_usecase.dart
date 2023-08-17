import 'package:dartz/dartz.dart';
import 'package:honkai_assistance/common/error/failure.dart';
import 'package:honkai_assistance/domain/entities/topup_checkout_entity.dart';
import 'package:honkai_assistance/domain/repositories/remote_repository.dart';

class TopUpCheckoutUsecase {
  final RemoteRepository remoteRepository;

  TopUpCheckoutUsecase({required this.remoteRepository});

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

  Future<void> postTopUpCheckout(
      TopUpCheckoutEntity topUpCheckout, String userEmail) async {
    await remoteRepository.createTopUpCheckout(
        topUpCheckout.toModel(), userEmail);
  }

  Future<void> updateTopUpCheckout(TopUpCheckoutEntity topUpCheckout,
      String userEmail, String topUpCheckoutId) async {
    await remoteRepository.putTopUpCheckout(
        topUpCheckout.toModel(), topUpCheckoutId, userEmail);
  }
}

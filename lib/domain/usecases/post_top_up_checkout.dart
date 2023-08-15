import 'package:honkai_assistance/domain/entities/topup_checkout_entity.dart';
import 'package:honkai_assistance/domain/repositories/remote_repository.dart';

class PostTopUpCheckout {
  final RemoteRepository remoteRepository;

  PostTopUpCheckout({required this.remoteRepository});

  Future<void> call(TopUpCheckoutEntity topUpCheckout) async {
    await remoteRepository.createTopUpCheckout(topUpCheckout.toModel());
  }
}

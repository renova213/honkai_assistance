import 'package:dartz/dartz.dart';
import 'package:honkai_assistance/common/error/error.dart';
import 'package:honkai_assistance/domain/repositories/remote_repository.dart';

class PostGoogleSignIn {
  final RemoteRepository remoteRepository;

  PostGoogleSignIn({required this.remoteRepository});

  Future<Either<Failure, String>> call() async {
    final gAuth = await remoteRepository.googleSignIn();

    return gAuth;
  }
}

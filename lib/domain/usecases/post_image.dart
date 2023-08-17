import 'dart:io';

import 'package:honkai_assistance/domain/repositories/remote_repository.dart';

class PostImage {
  final RemoteRepository remoteRepository;

  PostImage({required this.remoteRepository});

  Future<String> uploadImage(File file, String path) async {
    return await remoteRepository.postImage(file, path);
  }
}

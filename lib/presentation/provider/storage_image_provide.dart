import 'dart:io';

import 'package:flutter/material.dart';
import 'package:honkai_assistance/domain/usecases/post_image.dart';
import 'package:image_picker/image_picker.dart';

class StorageImageProvider extends ChangeNotifier {
  final PostImage postImage;

  StorageImageProvider({required this.postImage});

  String? _urlProductImage;
  File? _image;
  String? _imageName;
  final _imagePicker = ImagePicker();

  String? get urlProductImage => _urlProductImage;
  File? get image => _image;
  String? get imageName => _imageName;

  Future<void> uploadProductImage() async {
    final date = DateTime.now();
    try {
      _urlProductImage = await postImage.uploadImage(
          File(_image!.path), 'files/$date-$_imageName');
    } catch (_) {
      rethrow;
    }
  }

  // Future<void> deleteImage(String url) async {
  //   try {
  //     await remoteRepository.deleteImage(url);
  //   } catch (_) {
  //     rethrow;
  //   }
  // }

  Future<void> getImage() async {
    final image = await _imagePicker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      _image = File(image.path);
      _imageName = image.name;
    }
    notifyListeners();
  }

  Future<void> clearImage() async {
    _image = null;
    _urlProductImage = '';
    _imageName = '';
    notifyListeners();
  }

  Future<void> getUrlProductImage(String url) async {
    _urlProductImage = url;
    notifyListeners();
  }
}

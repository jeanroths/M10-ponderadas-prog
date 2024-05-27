import 'dart:typed_data';
import 'dart:io';
import 'package:image_app/services/api_service.dart';

class ImageController {
  Future<Uint8List?> uploadImage(File imageFile) async {
    final response = await ApiService.uploadImage(imageFile);

    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      return null;
    }
  }
}

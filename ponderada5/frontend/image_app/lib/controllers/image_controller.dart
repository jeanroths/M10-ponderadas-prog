import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../controllers/notification_controller.dart';

class ImageController {
  final NotificationController _notificationController = NotificationController();

  Future<Uint8List?> uploadImage(BuildContext context, File filePath) async {
    try {
      final response = await ApiService.uploadImage(filePath);
      if (response.statusCode == 200) {
        _notificationController.notifyImageProcessed();
        return response.bodyBytes;  // Assumindo que a resposta contém os bytes da imagem processada
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Falha ao processar imagem')),
        );
        return null;
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro: $e')),
      );
      return null;
    }
  }
}

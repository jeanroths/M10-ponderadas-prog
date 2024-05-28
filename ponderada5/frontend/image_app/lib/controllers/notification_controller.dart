import '../services/notification_service.dart';

class NotificationController {
  final NotificationService _notificationService = NotificationService();

  void notifyImageProcessed() {
    _notificationService.showNotification(
      'Imagem Processada',
      'Sua imagem foi processada com sucesso.',
    );
  }
}

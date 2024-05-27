import 'package:image_app/services/api_service.dart';

class LoginController {
  static Future<bool> login(String email, String password) async {
    final response = await ApiService.login(email, password);
    return response.statusCode == 200;
  }

  static Future<bool> signup(String email, String password) async {
    final response = await ApiService.signup(email, password);
    return response.statusCode == 200;
  }
}

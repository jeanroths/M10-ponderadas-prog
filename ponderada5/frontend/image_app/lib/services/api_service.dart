import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = 'http://192.168.118.237:8000';

  static Future<http.Response> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/users/login');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );
    return response;
  }

  static Future<http.Response> signup(String email, String password) async {
    final url = Uri.parse('$baseUrl/users/signup');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );
    return response;
  }

}
//   static Future<http.Response> uploadImage(/* Image file */) async {
//     final url = Uri.parse('$baseUrl/images/upload');
//     // Implement the logic to upload the image file
//   }
// }
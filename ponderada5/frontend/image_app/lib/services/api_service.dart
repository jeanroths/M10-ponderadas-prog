import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class ApiService {
  static const String baseUrl = 'http://192.168.118.237:8001';
  static const String imageUrl = 'http://192.168.118.237:8002';

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


  static Future<http.Response> uploadImage(File imageFile) async {
    final url = Uri.parse('$imageUrl/images/upload');
    final request = http.MultipartRequest('POST', url);
    request.files.add(await http.MultipartFile.fromPath('image', imageFile.path));

    final response = await request.send();
    return await http.Response.fromStream(response);
  }
}
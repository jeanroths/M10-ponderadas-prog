import 'package:http/http.dart' as http;

class ImageService {
  Future<void> uploadImage(String imagePath, String fcmToken) async {
    var url = Uri.parse('http://192.168.118.237:8001/images/upload');
    var request = http.MultipartRequest('POST', url);

    request.files.add(await http.MultipartFile.fromPath('image', imagePath));
    request.fields['fcm_token'] = fcmToken;

    var response = await request.send();

    if (response.statusCode != 200) {
      throw Exception('Failed to upload image');
    }
  }
}

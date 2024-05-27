import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:local_rembg/local_rembg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import '../models/process_status.dart';

class ImageController extends ChangeNotifier {
  final ImagePicker picker = ImagePicker();
  ProcessStatus status = ProcessStatus.none;
  String? message;
  Uint8List? imageBytes;

  Future<void> pickPhoto() async {
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      status = ProcessStatus.loading;
      notifyListeners();

      try {
        // Upload da imagem para o backend
        final uploadResponse = await uploadImage(File(pickedFile.path));
        if (uploadResponse != 200) {
          status = ProcessStatus.failure;
          message = 'Falha no upload da imagem';
          notifyListeners();
          return;
        }

        LocalRembgResultModel localRembgResultModel = await LocalRembg.removeBackground(
          imagePath: pickedFile.path,
        );

        if (localRembgResultModel.status == 1 && localRembgResultModel.imageBytes != null) {
          imageBytes = Uint8List.fromList(localRembgResultModel.imageBytes!);
          status = ProcessStatus.success;
        } else {
          message = localRembgResultModel.errorMessage ?? 'Failed to process image';
          status = ProcessStatus.failure;
        }
        notifyListeners();
      } catch (e) {
        message = 'Exception: $e';
        status = ProcessStatus.failure;
        notifyListeners();
      }
    }
  }

  Future<int> uploadImage(File imageFile) async {
    var request = http.MultipartRequest('POST', Uri.parse('http://your-backend-url/upload-image/'));
    request.files.add(await http.MultipartFile.fromPath('file', imageFile.path));
    var res = await request.send();
    return res.statusCode;
  }

  Future<void> saveImage(BuildContext context) async {
    if (imageBytes == null) return;

    if (await Permission.storage.request().isGranted) {
      final directory = await getExternalStorageDirectory();
      if (directory != null) {
        final path = '${directory.path}/processed_image.png';
        final file = File(path);
        await file.writeAsBytes(imageBytes!);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Image saved to $path')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Storage permission not granted')),
      );
    }
  }
}

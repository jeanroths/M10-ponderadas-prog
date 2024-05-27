import 'package:flutter/material.dart';
import 'package:image_app/controllers/image_controller.dart';

class ImageUploadPage extends StatefulWidget {
  const ImageUploadPage({Key? key}) : super(key: key);

  @override
  _ImageUploadPageState createState() => _ImageUploadPageState();
}

class _ImageUploadPageState extends State<ImageUploadPage> {
  Future<void> _uploadImage() async {
    // Implement the image picking and uploading logic
    // Call ImageController.uploadImage(imageFile);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Image'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _uploadImage,
              child: const Text('Select and Upload Image'),
            ),
          ],
        ),
      ),
    );
  }
}

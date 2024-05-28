import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../controllers/image_controller.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({super.key});

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  final ImagePicker _picker = ImagePicker();
  final ImageController _imageController = ImageController();
  Uint8List? _imageBytes;
  bool _isLoading = false;
  String? _message;

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _isLoading = true;
      });

      File imageFile = File(pickedFile.path);
      Uint8List? processedImage = await _imageController.uploadImage(context, imageFile);

      if (processedImage != null) {
        setState(() {
          _imageBytes = processedImage;
          _isLoading = false;
          _message = 'Imagem processada com sucesso';
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Imagem processada com sucesso')),
        );
      } else {
        setState(() {
          _isLoading = false;
          _message = 'Falha ao processar imagem';
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Falha ao processar imagem')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Background Remover'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_isLoading)
              const CircularProgressIndicator(),
            if (_imageBytes != null && !_isLoading)
              SizedBox(
                height: screenSize.width * 0.8,
                child: Image.memory(_imageBytes!),
              ),
            if (_message != null)
              Text(
                _message!,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Escolher Imagem'),
            ),
          ],
        ),
      ),
    );
  }
}

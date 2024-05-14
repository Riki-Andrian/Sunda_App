import 'dart:io';
import 'package:flutter/material.dart';
//import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';
import 'package:image_picker/image_picker.dart';

class TestOcr extends StatefulWidget {
  const TestOcr({super.key});

  @override
  State<TestOcr> createState() => _TestOcrState();
}

class _TestOcrState extends State<TestOcr> {
  bool _scanning = false;
  String _extractText = '';
  String _aksara = '';
  File? _pickedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text('Tesseract OCR'),
      ),
      body: ListView(
        children: [
          _pickedImage == null
              ? Container(
                  height: 300,
                  color: Colors.grey[300],
                  child: Icon(
                    Icons.image,
                    size: 100,
                  ),
                )
              : Container(
                  height: 300,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      image: DecorationImage(
                        image: FileImage(_pickedImage!),
                        fit: BoxFit.fill,
                      )),
                ),
          Container(
            height: 50,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: ElevatedButton(
              child: Text(
                'Pick Image with text',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () async {
                setState(() {
                  _scanning = true;
                });
                final pickedImage =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                // if (pickedImage != null) {
                //   _pickedImage = File(pickedImage.path);
                //   _extractText = await FlutterTesseractOcr.extractText(
                //       _pickedImage!.path,
                //       language: 'sun',
                //       args: {
                //         "psm": "4",
                //         "preserve_interword_spaces": "1",
                //       });
                //   _aksara = await FlutterTesseractOcr.getTessdataPath();
                //   print(_extractText);
                //   print(_pickedImage!.path);
                // }
                setState(() {
                  _scanning = false;
                });
              },
            ),
          ),
          SizedBox(height: 20),
          _scanning
              ? Center(child: CircularProgressIndicator())
              : Icon(
                  Icons.done,
                  size: 40,
                  color: Colors.green,
                ),
          SizedBox(height: 20),
          Center(
            child: Text(
              _extractText,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}

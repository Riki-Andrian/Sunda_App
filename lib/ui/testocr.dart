import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:sunda_app/data/model/prediction.dart';


class TesOcr extends StatefulWidget {
  @override
  _TesOcrState createState() => _TesOcrState();
}

class _TesOcrState extends State<TesOcr> {
  final picker = ImagePicker();
  File? _imageFile;
  String? _uploadStatus;
  List<Prediction> _predictions = [];


  Future<void> _getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
        _predictions.clear();
      });
    }
  }

  Future<void> _uploadImageToRoboflow() async {
  if (_imageFile == null) {
    setState(() {
      _uploadStatus = "Silakan pilih gambar terlebih dahulu";
    });
    return;
  }

  String apiUrl = "https://610ebf35-7fb0-4b8b-8ae2-570d05fe2be8-00-2ztqtdertq5j3.sisko.replit.dev/";  // Ganti dengan URL Replit Anda atau tempat lainnya

  try {
    var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
    request.files.add(await http.MultipartFile.fromPath('image', _imageFile!.path));

    var response = await request.send();

    // Handle response
    if (response.statusCode == 200) {
      var jsonResponse = await response.stream.bytesToString();
      var decodedResponse = jsonDecode(jsonResponse);

      List<Prediction> predictions = [];
        if (decodedResponse.containsKey('predictions')) {
          for (var prediction in decodedResponse['predictions']) {
            predictions.add(Prediction.fromJson(prediction));
          }
        }

        setState(() {
          _uploadStatus = "Gambar berhasil diunggah dan dianalisis";
          _predictions = predictions;
        });
        print(jsonResponse);

    } else {
      setState(() {
        _uploadStatus = "Gagal mengunggah gambar: ${response.statusCode}";
      });
      print('Gagal mengunggah gambar: ${response.statusCode}');
    }
  } catch (e) {
    print('Error uploading image: $e');
    setState(() {
      _uploadStatus = "Error mengunggah gambar";
    });
  }
}


  // Future<void> _uploadImageToRoboflow() async {
  //   if (_imageFile == null) {
  //     setState(() {
  //       _uploadStatus = "Silakan pilih gambar terlebih dahulu";
  //     });
  //     return;
  //   }

  //   String apiUrl = "https://detect.roboflow.com/aksara-sunda-eayhq/3?api_key=DpYDnYVS3X1D1jzuuMPY";  // Ganti dengan URL Roboflow
  //   //String apiKey = "DpYDnYVS3X1D1jzuuMPY";  // Ganti dengan API Key Roboflow

  //   try {
  //     // Convert image to base64
  //     List<int> imageBytes = await _imageFile!.readAsBytes();
  //     String base64Image = base64Encode(imageBytes);

  //     // Mengambil nama file dari path gambar yang dipilih
  //     String fileName = _imageFile!.path.split('/').last;

  //     // Make POST request to Roboflow
  //     var response = await http.post(
  //       // Uri.parse('$apiUrl?api_key=$apiKey&name=$fileName'),
  //       Uri.parse(apiUrl),
  //       headers: {
  //         "Content-Type": "application/x-www-form-urlencoded",
  //       },
  //       body: {
  //         "data": base64Image,
  //         //"name": fileName,
  //       },
  //     );

  //     // Handle response
  //     if (response.statusCode == 200) {
  //       setState(() {
  //         _uploadStatus = "Gambar berhasil diunggah dan dianalisis";
  //       });
  //       print(response.body);
  //     } else {
  //       setState(() {
  //         _uploadStatus = "Gagal mengunggah gambar: ${response.statusCode} ${fileName}";
  //       });
  //       print('Gagal mengunggah gambar: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('Error uploading image: $e');
  //     setState(() {
  //       _uploadStatus = "Error mengunggah gambar";
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contoh Unggah Gambar & Deteksi OCR'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _getImageFromGallery,
              child: Text('Pilih Gambar'),
            ),
            SizedBox(height: 20),
            if (_imageFile != null)
              Image.file(
                _imageFile!,
                height: 200,
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _uploadImageToRoboflow,
              child: Text('Unggah & Deteksi Huruf Sunda'),
            ),
            if (_uploadStatus != null) ...[
              SizedBox(height: 20),
              Text(
                _uploadStatus!,
                style: TextStyle(fontSize: 18),
              ),
            ],
            SizedBox(height: 20),
            if(_predictions.isNotEmpty)
            Expanded(
              child: ListView.builder(
                itemCount: _predictions.length,
                itemBuilder: (context, index) {
                  var prediction = _predictions[index];
                  return ListTile(
                    title: Text('Class: ${prediction.classType}'),
                  );
              
            },))
          ],
        ),
      ),
    );
  }
}

// import 'dart:io';
// import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';
// import 'package:image/image.dart' as img;


// Future<void> main() async {
//   // Install Tesseract OCR
//   await Process.run('sudo', ['apt', 'install', 'tesseract-ocr']);

//   // Install Dart package for Tesseract OCR
//   await Process.run('pub', ['global', 'activate', 'tesseract_ocr']);

//   // Set the Tesseract data directory
//   FlutterTesseractOcr.getTessdataPath('/usr/share/tesseract-ocr/4.00/tessdata/');

//   // Upload the image
//   stdout.write('Please upload an image: ');
//   final file = File(await stdin.readLineSync()!);

//   // Open the image
//   final image = img.decodeImage(await file.readAsBytes())!;

//   // Perform OCR on the image
//   final text = await FlutterTesseractOcr.extract(image, language: 'sun');
//   print(text);
// }


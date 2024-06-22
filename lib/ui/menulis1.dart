// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
// import 'dart:typed_data';
// import 'dart:ui' as ui;
// import 'package:image/image.dart' as img;
// import 'package:path_provider/path_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';

// class Menulis1 extends StatefulWidget {
//   const Menulis1({super.key});

//   @override
//   State<Menulis1> createState() => _Menulis1State();
// }

// class _Menulis1State extends State<Menulis1> {
//   GlobalKey globalKey = GlobalKey();
//   List<List<Offset>> paths = [];
//   String path = "";

//   // Method to capture image from CustomPaint
// //   Future<ui.Image> _captureImage() async {
// //     RenderRepaintBoundary boundary =
// //         globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
// //     ui.Image image = await boundary.toImage(pixelRatio: 3.0);
// //     return image;
// //   }

// // Future<void> _performOCR() async {
// //     ui.Image image = await _captureImage();
// //     ByteData? byteData = await image.toByteData();
// //     Uint8List? imageData = byteData?.buffer.asUint8List();
// //     if (imageData != null) {
// //       String base64Image = base64Encode(imageData);
// //       String imagePath = await _saveImageToTemporaryDirectory(imageData);
// //       String recognizedText =
// //           await FlutterTesseractOcr.extractText(image, language: 'sun');
// //       print("Recognized Text: $recognizedText");
// //     } else {
// //       print("Error: Failed to capture image data");
// //     }
// //   }
// //   Future<String> _saveImageToTemporaryDirectory(Uint8List imageData) async {
// //     Directory tempDir = await getTemporaryDirectory();
// //     String tempPath = tempDir.path;
// //     File tempFile = File('$tempPath/image.png');
// //     await tempFile.writeAsBytes(imageData);
// //     return tempFile.path;
// //   }

// //   Future<void> _performOCR() async {
// //   Uint8List? imageBytes = await _capturePng();
// //   if (imageBytes != null) {
// //     String base64Image = base64Encode(imageBytes);
// //     String recognizedText =
// //         await FlutterTesseractOcr.extractText(base64Image, language: 'sun');
// //     // Do something with recognized text
// //     print("Recognized Text: $recognizedText");
// //   } else {
// //     print("Error: Image bytes are null");
// //   }
// // }

// //  Future<void> _performOCR() async {
// //   try {
// //     // Render custom paint to image
// //     RenderRepaintBoundary boundary = globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
// //     ui.Image image = await boundary.toImage(pixelRatio: 3.0);
// //     ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.rawRgba);
// //     Uint8List imageData = byteData!.buffer.asUint8List();

// //     img.Image imgData = img.Image.fromBytes(image.width, image.height, imageData);

// //     // Save the image as temporary file
// //     final tempDir = await getTemporaryDirectory();
// //     final tempFile = File('${tempDir.path}/image.jpg');
// //     await tempFile.writeAsBytes(img.encodeJpg(imgData));

// //     // Perform OCR on the image file
// //     String extractedText =  await FlutterTesseractOcr.extractText(tempFile.path,  language: 'sun');
// //     String extractedHocr =  await FlutterTesseractOcr.(tempFile.path,  language: 'sun');

// //     // Handle the extracted text
// //     print(extractedText);
// //     print(extractedHocr);

// //   } catch (e) {
// //     print(e.toString()); // Handle errors
// //   }
// // }

//   Future<void> _performOCR() async {
//     try {
//       // Render custom paint to image
//       RenderRepaintBoundary boundary =
//           globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
//       ui.Image image = await boundary.toImage(pixelRatio: 3.0);
//       ByteData? byteData =
//           await image.toByteData(format: ui.ImageByteFormat.png);

//       if (byteData == null) {
//         print("Error: Failed to obtain ByteData from image.");
//         return;
//       }

//       Uint8List imageData = byteData.buffer.asUint8List();

//       // Save the image as temporary file
//       Directory tempDir = await getTemporaryDirectory();
//       File tempFile = File('${tempDir.path}/image.png');
//       await tempFile.writeAsBytes(imageData);
//       path = tempFile.path;

//       // Perform OCR on the image file
//       String extractedText =
//           await FlutterTesseractOcr.extractText(path, language: 'sun');

//       if (extractedText.isEmpty) {
//         print("kosong");
//       } else {
//         print("Extracted Text: $extractedText");
//       }

//       // Handle the extracted text
//       print("Image Path: $path");
//     } catch (e) {
//       print("Error: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Custom Paint & OCR'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: GestureDetector(
//               onPanStart: (details) {
//                 // Mulai jalur baru saat pengguna mulai menggambar
//                 paths.add([details.localPosition]);
//               },
//               onPanUpdate: (details) {
//                 setState(() {
//                   // Tambahkan titik ke jalur yang sedang digambar
//                   paths.last.add(details.localPosition);
//                 });
//               },
//               onPanEnd: (details) {
//                 // Memeriksa kesesuaian jalur dengan jalur yang diharapkan
//               },
//               child: RepaintBoundary(
//                 key: globalKey,
//                 child: CustomPaint(
//                   painter: MyCustomPainter(paths: paths),
//                   size: Size.infinite,
//                 ),
//               ),
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               _performOCR();
//             },
//             child: Text('Perform OCR'),
//           ),
//           // path.isNotEmpty
//           //     ? Expanded(
//           //         child: Image.file(File(path)),
//           //       )
//           //     : Container(),
//         ],
//       ),
//     );
//   }
// }

// class MyCustomPainter extends CustomPainter {
//   final List<List<Offset>> paths;

//   MyCustomPainter({required this.paths});

//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.black
//       ..strokeWidth = 8.0
//       ..strokeCap = StrokeCap.round;

//     // Gambar setiap jalur yang telah digambar oleh pengguna
//     for (var path in paths) {
//       for (int i = 0; i < path.length - 1; i++) {
//         canvas.drawLine(path[i], path[i + 1], paint);
//       }
//     }
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }

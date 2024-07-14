import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/widgets.dart';
import 'package:http/http.dart'
    as http; // Import http untuk melakukan POST request
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sunda_app/data/model/prediction.dart';

class Menulis extends StatefulWidget {
  const Menulis({super.key});

  @override
  State<Menulis> createState() => _MenulisState();
}

class _MenulisState extends State<Menulis> {
  GlobalKey globalKey = GlobalKey();
  List<List<Offset>> paths = [];
  List<Prediction> _predictions = [];
  List<String> _huruf = [
    "a",
    "ae",
    "ba",
    "ca",
    "da",
    "e",
    "eu",
    "fa",
    "ga",
    "ha",
    "i",
    "ja",
    "ka",
    "la",
    "ma",
    "na",
    "nga",
    "nya",
    "o",
    "pa",
    "qa",
    "ra",
    "sa",
    "ta",
    "u",
    "va",
    "wa",
    "xa",
    "ya",
    "za"
  ];
  String? imagePath; // Path gambar sementara
  String? _randomHuruf; // Huruf acak yang diambil
  String? _randomHurufImagePath; // Path gambar huruf acak

  @override
  void initState() {
    super.initState();
    _pickRandomHuruf(); // Memilih huruf acak saat aplikasi dimulai
  }

  Future<void> _captureAndSaveImage() async {
    // Membuat gambar kosong dengan latar belakang putih
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(
        recorder,
        Rect.fromPoints(Offset(0.0, 0.0),
            Offset(300.0, 500.0))); // Sesuaikan ukuran sesuai kebutuhan
    canvas.drawRect(Rect.fromLTWH(0, 0, 300, 500),
        Paint()..color = Colors.white); // Menggambar latar belakang putih

    // Menggambar jalur yang digambar oleh pengguna
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 8.0
      ..strokeCap = StrokeCap.round;

    // Gambar setiap jalur yang telah digambar oleh pengguna
    for (var path in paths) {
      for (int i = 0; i < path.length - 1; i++) {
        canvas.drawLine(path[i], path[i + 1], paint);
      }
    }

    // Mengonversi ke image
    final ui.Image image = await recorder
        .endRecording()
        .toImage(300, 500); // Sesuaikan ukuran sesuai kebutuhan
    final ByteData? byteData =
        await image.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List pngBytes = byteData!.buffer.asUint8List();

    // Mendapatkan direktori penyimpanan lokal
    final directory = await getTemporaryDirectory();
    String tempPath = '${directory.path}/image.png';

    // Menyimpan gambar sebagai file PNG
    File imageFile = File(tempPath);
    await imageFile.writeAsBytes(pngBytes);

    setState(() {
      imagePath = tempPath; // Simpan path gambar sementara
      _predictions.clear();
    });
  }

  Future<void> _uploadImageToRoboflow() async {
    if (imagePath == null) {
      setState(() {
        // Handling jika tidak ada gambar yang disimpan
        // Anda dapat menambahkan logika sesuai kebutuhan aplikasi Anda
      });
      return;
    }

    String apiUrl =
        "https://610ebf35-7fb0-4b8b-8ae2-570d05fe2be8-00-2ztqtdertq5j3.sisko.replit.dev/"; // Ganti dengan URL API Roboflow Anda

    try {
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
      request.files.add(await http.MultipartFile.fromPath('image', imagePath!));

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
          print("Gambar berhasil diunggah dan dianalisis");
          _predictions = predictions;
          _checkPrediction();
        });
        print(jsonResponse);
        // Handle predictions from Roboflow response if needed
        print(jsonResponse);
      } else {
        print('Gagal mengunggah gambar: ${response.statusCode}');
      }
    } catch (e) {
      print('Error uploading image: $e');
    }
  }

  void clearPaths() {
    setState(() {
      paths.clear(); // Menghapus semua jalur yang digambar
    });
  }

  void _pickRandomHuruf() {
    final random = Random();
    _randomHuruf = _huruf[random.nextInt(_huruf.length)];
    _randomHurufImagePath =
        'assets/Hint/$_randomHuruf.PNG'; // Asumsi path gambar di folder assets
    setState(() {}); // Refresh UI untuk menampilkan gambar
  }

  void _showRandomHurufImage() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(_randomHuruf!),
          content: _randomHurufImagePath != null
              ? Image.asset(_randomHurufImagePath!)
              : Text('No image selected'),
          actions: <Widget>[
            TextButton(
              child: Text('Tutup'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _checkPrediction() {
    bool match = false;
    for (var prediction in _predictions) {
      if (prediction.classType == _randomHuruf) {
        match = true;
        break;
      }
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(match ? 'Berhasil' : 'Gagal'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(
                  match
                      ? 'assets/aplikasi/Checkmark.json'
                      : 'assets/aplikasi/Cross.json',
                  width: 150,
                  height: 150,
                  fit: BoxFit.fill),
              SizedBox(
                height: 20,
              ),
              Text(match
                  ? 'Huruf yang diunggah sesuai dengan prediksi.'
                  : 'Huruf yang diunggah tidak sesuai dengan prediksi.'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Tutup'),
              onPressed: () {
                Navigator.of(context).pop();
                clearPaths();
                _pickRandomHuruf();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Latihan Menulis'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
                onPressed: _showRandomHurufImage, icon: Icon(Icons.info)),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Container(
              child: Text(
                _randomHuruf!,
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          Expanded(
            child: Card(
              child: GestureDetector(
                onPanStart: (details) {
                  // Mulai jalur baru saat pengguna mulai menggambar
                  paths.add([details.localPosition]);
                },
                onPanUpdate: (details) {
                  setState(() {
                    // Tambahkan titik ke jalur yang sedang digambar
                    paths.last.add(details.localPosition);
                  });
                },
                onPanEnd: (details) {
                  // Optional: Hapus jalur yang selesai digambar
                },
                child: RepaintBoundary(
                  key: globalKey,
                  child: CustomPaint(
                    painter: MyCustomPainter(paths: paths),
                    size: Size.infinite,
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await _captureAndSaveImage(); // Menyimpan gambar terlebih dahulu
              await _uploadImageToRoboflow(); // Mengunggah gambar ke Roboflow
            },
            child: Text('Cek penulisan'),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed:
                      clearPaths, // Memanggil metode clearPaths saat tombol ditekan
                  child: Text('Hapus'),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: _pickRandomHuruf, child: Text("Muat ulang")),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MyCustomPainter extends CustomPainter {
  final List<List<Offset>> paths;

  MyCustomPainter({required this.paths});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 8.0
      ..strokeCap = StrokeCap.round;

    // Gambar setiap jalur yang telah digambar oleh pengguna
    for (var path in paths) {
      for (int i = 0; i < path.length - 1; i++) {
        canvas.drawLine(path[i], path[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

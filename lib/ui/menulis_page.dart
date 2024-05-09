import 'package:flutter/material.dart';

class Menulis extends StatefulWidget {
  @override
  _MenulisState createState() => _MenulisState();
}

class _MenulisState extends State<Menulis> {
  List<List<Offset>> paths= [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tracing Huruf'),
      ),
      body: GestureDetector(
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
          // Memeriksa kesesuaian jalur dengan jalur yang diharapkan
        },
        child: CustomPaint(
          painter: TracingPainter(paths: paths),
          size: Size.infinite,
        ),
      ),
    );
  }
}

class TracingPainter extends CustomPainter {
  final List<List<Offset>> paths;

  TracingPainter({required this.paths});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
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
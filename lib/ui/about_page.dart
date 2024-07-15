import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang Aplikasi Nyunda'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Deskripsi Aplikasi:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Aplikasi kami, "Nyunda", dirancang untuk menyediakan solusi bagi pengguna dalam hal belajar budaya Sunda.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Fitur Utama:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('- Fitur 1: Konversi Tulisan'),
            Text('- Fitur 2: Terjemahan'),
            Text('- Fitur 3: Kamus'),
            Text('- Fitur 4: Pupuh'),
            Text('- Fitur 5: Peribahasa'),
            Text('- Fitur 6: Penulisan'),
            Text('- Fitur 7: Quiz'),
            Text('- Fitur 8: Huruf'),
            SizedBox(height: 16),
            Text(
              'Versi Terbaru:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Versi aplikasi saat ini: 1.0.0'),
            SizedBox(height: 16),
            Text(
              'Pengembang:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Riki Andrian Nugraha'),
            Text('Kontak: rikinugraha0103@gmail.com'),
             SizedBox(height: 16),
            Text(
              'Library:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('- Library 1: © 2013 Dian Tresna Nugraha Dirilis dina lisénsi: GNU (Lisénsi Publik Umum)'),
            Text('- Library 2: flutter_js'),
            Text('- Library 3: flutter_signature_pad'),
            Text('- Library 4: hive'),
            Text('- Library 5: image'),
            Text('- Library 6: Penulisan'),
            Text('- Library 7: translator'),
            Text('- Library 8: go_router'),
          ],
        ),
      ),
    );
  }
}
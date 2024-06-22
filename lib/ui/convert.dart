// import 'package:flutter/material.dart';
// import 'package:flutter_js/flutter_js.dart';
// // import 'package:flutter_js/js_value.dart';

// class MyPage extends StatefulWidget {
//   @override
//   _MyPageState createState() => _MyPageState();
// }

// class _MyPageState extends State<MyPage> {
//   final flutterJs = FlutterJs();

//   @override
//   void initState() {
//     super.initState();
//     loadAndRunJavaScript();
//   }

//   Future<void> loadAndRunJavaScript() async {
//     // Inisialisasi Flutter JS
//     await flutterJs.init();

//     // Muat file JavaScript dari assets
//     final script = await rootBundle.loadString('assets/your_script.js'); // Ganti dengan nama file JavaScript yang benar

//     // Jalankan script JavaScript
//     final result = await flutterJs.runString(script);

//     // Pastikan eksekusi berhasil
//     if (result.error != null) {
//       print('Error executing JavaScript: ${result.error}');
//     } else {
//       // Eksekusi fungsi JavaScript
//       final jsFunction = flutterJs.call('Latin2Sunda'); // Ganti dengan nama fungsi yang benar
//       final jsResult = await jsFunction.applyAsync(['Input teks dalam bahasa Latin']);
//       print('Hasil konversi: $jsResult');
//     }
//   }

//   @override
//   void dispose() {
//     flutterJs.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter JS Example'),
//       ),
//       body: Center(
//         child: Text('Hasil konversi akan muncul di konsol log.'),
//       ),
//     );
//   }
// }

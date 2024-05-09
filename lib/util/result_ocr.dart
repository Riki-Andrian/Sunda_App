// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';


// class TestResultsActivity extends StatefulWidget {
//   @override
//   _TestResultsActivityState createState() => _TestResultsActivityState();
// }

// class _TestResultsActivityState extends State<TestResultsActivity> {
//   List<Map<String, double>> _dataList = [];
//   List<String> _bottomTextList = [];
//   bool _isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _initData();
//   }

//   Future<void> _initData() async {
//     try {
//       List<String> statisticData = await FlutterTesseractOcr.getStatisticData("PenulisanKarakter");
//       _setData(statisticData);
//     } catch (e) {
//       print("Error: $e");
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   void _setData(List<String> statisticData) {
//     if (statisticData.isNotEmpty) {
//       _bottomTextList = statisticData.map((str) => '$str (ms)').toList();
//       _dataList = [
//         {"data": statisticData.map((str) => double.parse(str)).toList()},
//       ];
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Hasil Test"),
//       ),
//       body: _isLoading
//           ? Center(child: CircularProgressIndicator())
//           : _dataList.isNotEmpty
//                ? Center(child: Text("Sudah ada hasil test"))
//               // LineChart(
//               //     data: _dataList,
//               //     bottomTitles: _bottomTextList,
//               //     showCircles: true,
//               //     chartRadius: MediaQuery.of(context).size.width / 2,
//               //     showChartValues: false,
//               //   )
//               : Center(child: Text("Belum ada hasil test")),
//     );
//   }
// }

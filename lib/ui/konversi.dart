import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_js/flutter_js.dart';

class KonversiPage extends StatefulWidget {

  const KonversiPage({Key? key}) : super(key: key);

  @override
  State<KonversiPage> createState() => _KonversiPageState();
}

class _KonversiPageState extends State<KonversiPage> {
  final JavascriptRuntime jsRuntime = getJavascriptRuntime();

  TextEditingController _controller = TextEditingController();
  String latinText = '';
  String sundaText = '';
  String teksSunda = "Hasil";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Konversi"),
      ),
      body: _buildList(),
    );
  }

  Widget _buildList() {
    return Center(
      child: ListView(
        children: [
          SizedBox(
            height: 200.0,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(
                    color: Colors.blue,
                    width: 2,
                  )),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text("Huruf Latin -> Huruf sunda", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    Container(
                      height: 0.8,
                      color: Colors.blue[200],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        key: Key("latin"),
                        controller: _controller,
                        minLines: 1,
                        maxLines: 5,
                        onChanged: (text) async {
                          setState(() {
                            latinText = text;
                          });
                          try {
                            final result = await fromJs(jsRuntime, latinText);
                            teksSunda = result;
                          } on PlatformException catch (e) {
                            //print('erros: ${e.message}');
                            Text("error: ${e.message}");
                          }
                          if (latinText.isEmpty) {
                            teksSunda = " ";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'Masukkan teks Latin',
                          contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 32.0),
          Flexible(
            child: SizedBox(
              height: 200.0,
              width: 350,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Hasil",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        height: 0.8,
                        color: Colors.blue[200],
                      ),
                      Text(teksSunda, style: TextStyle(fontSize: 28),),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }

  Future<String> fromJs(JavascriptRuntime jsRuntime, String latinText) async {
    String sundaJs = await rootBundle.loadString("assets/SundaConv.js");

    try {
      final jsResult = await jsRuntime.evaluate(sundaJs);
      final jsEvalResult =
          await jsRuntime.evaluate('Latin2Sunda("$latinText")');

      if (jsEvalResult.stringResult is String) {
        return jsEvalResult.stringResult;
      } else {
        return "Error: Unexpected result type";
      }
    } catch (e) {
      return "Error: $e";
    }
  }
}

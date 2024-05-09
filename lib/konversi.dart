import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_js/flutter_js.dart';

class KonversiPage extends StatefulWidget {
  // final JavascriptRuntime jsRuntime;
  
  const KonversiPage({Key? key})
  : super(key: key);

  // KonversiPage.createWithRuntime({Key? key})
  //     : jsRuntime = getJavascriptRuntime(),
  //       super(key: key);

  @override
  State<KonversiPage> createState() => _KonversiPageState();
}

class _KonversiPageState extends State<KonversiPage> {
  final JavascriptRuntime jsRuntime = getJavascriptRuntime();

  // TextEditingController controller = TextEditingController();
  // String hasil = '';
  String latinText = '';
  String sundaText = '';
  String teksSunda="ᮃᮊᮩᮔ᮪ ᮃᮌᮦᮞ᮪ ᮃᮌᮨᮚᮔ᮪";

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
      child: Column(
        children: [
              Text(
                'Teks Latin',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        minLines: 1,
                        maxLines: 5,
                        
                        onChanged: (text) async {
                          setState(() {
                            latinText = text;
                          });
                          try{
                            final result = await fromJs(jsRuntime, latinText);
                            teksSunda = result; 
                          } on PlatformException catch(e){
                            //print('erros: ${e.message}');
                            Text("error: ${e.message}");
                          }
                          if(latinText.isEmpty){
                            teksSunda = " ";
                          }
                          // btLatin2Sunda(text);
                          
                        },
                        decoration: InputDecoration(
                          hintText: 'Masukkan teks Latin',
                          contentPadding: EdgeInsets.symmetric(vertical: 8.0)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Teks Sunda',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              TextField(
                onChanged: (text)  {
                  setState(() {
                    sundaText = text;
                  });
                  
                  // btSunda2Latin(text);
                },
                decoration: InputDecoration(
                  hintText: 'Masukkan teks Sunda',
                ),
              ),
              SizedBox(height: 20.0),
              Text('Perhatian: Install fonta Sundanese Unicode'),
              SizedBox(height: 30.0),
              Text(
                teksSunda,
                style: TextStyle(
                  fontSize: 28, 
                ),
              ),
              

              // Add buttons and conversion logic here
            ],
      ),
      
    );
  }

//  Future<String> fromJs( JavascriptRuntime jsRuntime, String latinText) async {
//   String sundaJs = await rootBundle.loadString("assets/SundaConv.js");
//    final jsResult = jsRuntime.evaluate(sundaJs + """Latin2Sunda($latinText)""");
//   //final jsResult = jsRuntime.evaluate('Latin2Sunda("$latinText")');
//   final jsStringResult = jsResult.stringResult;
//   return jsStringResult;
//  }

// Future<dynamic> fromJs(JavascriptRuntime jsRuntime, String latinText) async {
//   String sundaJs = await rootBundle.loadString("assets/SundaConv.js");

//   try {
//     final jsResult = await jsRuntime.evaluate(sundaJs);
//     final jsStringResult = await jsRuntime.evaluate('Latin2Sunda("$latinText")');
//     if (jsStringResult is String) {
//       return jsStringResult;
//     } else {
//       return "Error: Unexpected result type";
//     }

//   } catch (e) {
//     return "Error: $e";
//   }
// }

Future<String> fromJs(JavascriptRuntime jsRuntime, String latinText) async {
  String sundaJs = await rootBundle.loadString("assets/SundaConv.js");

  try {
    final jsResult = await jsRuntime.evaluate(sundaJs);
    final jsEvalResult = await jsRuntime.evaluate('Latin2Sunda("$latinText")');

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

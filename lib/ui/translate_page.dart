import 'package:flutter/material.dart';
import 'package:translator/translator.dart';


class TranslatePage extends StatefulWidget {
  const TranslatePage({super.key});

  @override
  State<TranslatePage> createState() => _TranslatePageState();
}

class _TranslatePageState extends State<TranslatePage> {
  String translated = 'Translation';
  final translator = GoogleTranslator();
  final TextEditingController _translate = TextEditingController();
  bool translateToSunda = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Translate'),
      ),
      body: _buildList(),
    );
  }

  Widget _buildList(){
    return Card(
      margin: const EdgeInsets.all(12),
      child: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Container(
            height: 30,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  translateToSunda = !translateToSunda;
                });
                _translateText(_translate.text);
              }, 
              child: Text(translateToSunda? 'Sunda => Indonesia' : 'Indonesia => Sunda')
              ),
              ),
          const Text('Indonesia'),
          const SizedBox(height: 8,),
          TextField(
            controller: _translate,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              hintText: 'Masukan kata'
            ),
            onChanged: (text) {       
               _translateText(text);    
            },
          ),
          const Divider(height: 32,),
          Text(
            translated,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

   Future<void> _translateText(String text) async {
    String fromLanguage = translateToSunda ? 'su' : 'id';
    String toLanguage = translateToSunda ? 'id' : 'su';

    if (text.isNotEmpty) {
      final translation = await translator.translate(text, from: fromLanguage, to: toLanguage);
      setState(() {
        translated = translation.text;
      });
    }else{
      translated = '';
    }
  }
}
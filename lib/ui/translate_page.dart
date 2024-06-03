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

  Widget _buildList() {
    return ListView(
      padding: EdgeInsets.all(20),
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            height: 30,
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    translateToSunda = !translateToSunda;
                  });
                  _translateText(_translate.text);
                },
                child: Text(translateToSunda
                    ? 'Sunda => Indonesia'
                    : 'Indonesia => Sunda')),
          ),
        ),
        Text(translateToSunda ? 'Sunda' : 'Indonesia'),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 200.0,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(
                  color: Colors.blue,
                  width: 2,
                )),
            child: TextField(
              controller: _translate,
              style: const TextStyle(
                fontSize: 20,
              ),
              onChanged: (text) {
                _translateText(text);
              },
              decoration: InputDecoration(
                hintText: 'Masukan kata',
                contentPadding: EdgeInsets.all(12.0),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 32.0,
        ),
        SizedBox(
          height: 200.0,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(
                  color: Colors.blue,
                  width: 2,
                )),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                translated,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Future<void> _translateText(String text) async {
    String fromLanguage = translateToSunda ? 'su' : 'id';
    String toLanguage = translateToSunda ? 'id' : 'su';

    if (text.isNotEmpty) {
      final translation =
          await translator.translate(text, from: fromLanguage, to: toLanguage);
      setState(() {
        translated = translation.text;
      });
    } else {
      translated = '';
    }
  }
}

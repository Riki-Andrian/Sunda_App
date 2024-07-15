import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AksaraPage extends StatelessWidget {
  AksaraPage({super.key});

  final List<String> ngalagena =
      List.generate(25, (index) => 'assets/ngalagena/1b${78 + index}.PNG');
  final List<String> angka =
      List.generate(10, (index) => 'assets/angka/1bb${index}.PNG');
  final List<String> vokal =
      List.generate(7, (index) => 'assets/swara/1b${83 + index}.PNG');
  List<String> _vokal = ['a', 'i', 'u', 'é', 'o', 'e', 'eu'];
  List<String> _ngalagena = [
    'ka',
    'qa',
    'ga',
    'nga',
    'ca',
    'ja',
    'ya',
    'ra',
    'la',
    'wa',
    'sa',
    'xa',
    'za',
    'nya',
    'ta',
    'da',
    'na',
    'pa',
    'fa',
    'va',
    'ba',
    'ma',
    'ha',
    'kha',
    'sya'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aksara"),
      ),
      body: _build(),
    );
  }

  Widget _build() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              "Vokal/Swara",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemCount: vokal.length,
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  children: [
                    Expanded(
                      child: Center(
                          child: Image.asset(
                        vokal[index],
                        fit: BoxFit.cover,
                      )),
                    ),
                    Center(
                      child: Text(
                        _vokal[index],
                        style: TextStyle(fontSize: 24),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
          SizedBox(
            height: 30,
          ),
           Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              "Ngalagena",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
            itemCount: ngalagena.length,
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  children: [
                    Expanded(
                      child: Center(
                          child: Image.asset(
                        ngalagena[index],
                        fit: BoxFit.cover,
                      )),
                    ),
                    Center(
                      child: Text(
                        _ngalagena[index],
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
          SizedBox(
            height: 30,
          ),
           Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              "Angka",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemCount: angka.length,
            itemBuilder: (context, index) {
              return Card(
                child: Column(
                  children: [
                    Expanded(
                      child: Center(
                          child: Image.asset(
                        angka[index],
                        fit: BoxFit.cover,
                      )),
                    ),
                    Center(
                      child: Text(index.toString(),
                          style: TextStyle(fontSize: 18)),
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AksaraPage extends StatelessWidget {
  AksaraPage({super.key});

  final List<String> ngalagena =
      List.generate(25, (index) => 'assets/ngalagena/1b${78 + index}.PNG');
  final List<String> angka =
      List.generate(10, (index) => 'assets/angka/1bb${index}.PNG');
  final List<String> vokal =
      List.generate(7, (index) => 'assets/swara/1b${83 + index}.PNG');

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
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
            itemCount: vokal.length,
            itemBuilder: (context, index) {
              return Card(
                child: Center(
                    child: Image.asset(
                  vokal[index],
                  fit: BoxFit.cover,
                )),
              );
            },
          ),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
            itemCount: ngalagena.length,
            itemBuilder: (context, index) {
              return Card(
                child: Center(
                    child: Image.asset(
                  ngalagena[index],
                  fit: BoxFit.cover,
                )),
              );
            },
          ),
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemCount: angka.length,
            itemBuilder: (context, index) {
              return Card(
                child: Center(
                    child: Image.asset(
                  angka[index],
                  fit: BoxFit.cover,
                )),
              );
            },
          ),
        ],
      ),
    );
  }
}

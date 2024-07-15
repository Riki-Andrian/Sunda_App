import 'package:flutter/material.dart';
import 'package:sunda_app/data/model/kamus.dart';

class KamusWidget extends StatelessWidget {
  final Kamus kamus;

  const KamusWidget({Key? key, required this.kamus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _build();
  }

  Widget _build(){
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        height: 50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(kamus.kamus_kata,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
            Text(kamus.kamus_arti,
            style: TextStyle(fontSize: 16),),
            Container(
              height: 0.8,
              color: Colors.blue[200],
            )
          ],
        ),
      ),
       );
  }
}
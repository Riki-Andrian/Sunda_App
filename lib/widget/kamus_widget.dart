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
      padding: EdgeInsets.all(4),
      child: Container(
        height: 100,
        child: Column(
          children: [
            Text(kamus.kamus_kata),
            Text(kamus.kamus_arti),
          ],
        ),
      ),
       );
  }
}
import 'package:flutter/material.dart';
import 'package:sunda_app/data/model/peribahasa.dart';

class PeribahasaWidget extends StatelessWidget {
  final Peribahasa peribahasa;

  const PeribahasaWidget({Key? key, required this.peribahasa}) : super(key: key);

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
            Text(peribahasa.peribahasa),
            Text(peribahasa.makna),
          ],
        ),
      ),
       );
  }
}
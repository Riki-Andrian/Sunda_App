import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sunda_app/data/model/peribahasa.dart';

class PeribahasaWidget extends StatelessWidget {
  final Peribahasa peribahasa;

  const PeribahasaWidget({Key? key, required this.peribahasa})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _build();
  }

  Widget _build() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(child: Text(peribahasa.peribahasa,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)),
          Container(child: Text(peribahasa.makna,
          style: TextStyle(fontSize: 16),)),
          Container(
            height: 0.8,
            color: Colors.blue[200],
          )
        ],
      ),
    );
  }
}

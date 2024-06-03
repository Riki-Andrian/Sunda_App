import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sunda_app/data/model/pupuh.dart';

class PupuhDetaiPage extends StatelessWidget {
  final PupuhSunda pupuhSunda;

  const PupuhDetaiPage({super.key, required this.pupuhSunda});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pupuhSunda.nama),
      ),
      body: _build(),
    );
  }

  Widget _build() {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lirik',
            style: TextStyle(fontSize: 12),
          ),
          ...pupuhSunda.lirik.versi1.map((line) => Text(line)).toList()
        ],
      ),
    );
  }
}

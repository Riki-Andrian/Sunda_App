import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  final int angka;

  const MenuWidget(this.angka, {super.key});

  @override
  Widget build(BuildContext context) {
    return _build(angka);
  }

  Widget _build(int angka){
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        color: Colors.amber,
        width: 80,
        height: 80,
        child: Center(
          child: Text(
            angka.toString()
          ),
        ),
      ),
      );
  }
}
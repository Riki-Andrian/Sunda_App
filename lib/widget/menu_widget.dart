import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuWidget extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback onTap;

   const MenuWidget({
    Key? key,
    required this.imagePath,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _build(imagePath, text, onTap);
  }

  Widget _build(String imagePath, String text, VoidCallback onTap){
    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: 4),
          borderRadius: BorderRadius.circular(10), // Menambahkan border berwarna biru
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                width: 48,
                height: 48,
              ),
              Text(text)
            ],
          ), // Menampilkan gambar/icon di tengah
        ),
      ),
    )
    );
  }
}
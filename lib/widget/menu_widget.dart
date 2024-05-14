import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  final IconData iconData;
  final String text;
  final VoidCallback onTap;

   const MenuWidget({
    Key? key,
    required this.iconData,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _build(iconData, text, onTap);
  }

  Widget _build(IconData iconData, String text, VoidCallback onTap){
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
              Icon(iconData),
              Text(text)
            ],
          ), // Menampilkan gambar/icon di tengah
        ),
      ),
    )
    );
  }
}
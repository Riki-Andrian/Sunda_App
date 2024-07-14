class MenuItem {
  final String imagePath; // Ubah tipe dari IconData menjadi String
  final String text;
  final String route;

  MenuItem({
    required this.imagePath,
    required this.text,
    required this.route,
  });
}
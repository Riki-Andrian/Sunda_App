import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sunda_app/data/model/menu_item.dart';
import 'package:sunda_app/ui/aksara_page.dart';
import 'package:sunda_app/ui/menulis1.dart';
import 'package:sunda_app/ui/menulis_page.dart';
import 'package:sunda_app/ui/test_menulis.dart';
import 'package:sunda_app/ui/testocr.dart';
import 'package:sunda_app/widget/menu_widget.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});

    List<MenuItem> menuItems = [
    MenuItem(
      imagePath: 'assets/aplikasi/Refresh.png',
      text: 'Konversi',
      route: '/konversi',
    ),
    MenuItem(
      imagePath: 'assets/aplikasi/Translate Text.png',
      text: 'Terjemahan',
      route: '/translate',
    ),
    MenuItem(
      imagePath: 'assets/aplikasi/Dictionary.png',
      text: 'Kamus',
      route: '/kamus',
    ),
    MenuItem(
      imagePath: 'assets/aplikasi/Books.png',
      text: 'Pupuh',
      route: '/pupuhpage',
    ),
    MenuItem(
      imagePath: 'assets/aplikasi/Quote.png',
      text: 'Peribahasa',
      route: '/peribahasa',
    ),
    MenuItem(
      imagePath: 'assets/aplikasi/Menulis.png',
      text: 'Penulisan',
      route: '/menulis',
    ),
    MenuItem(
      imagePath: 'assets/aplikasi/Ask Question.png',
      text: 'Qiuiz',
      route: '/quizmenu',
    ),
      MenuItem(
      imagePath: 'assets/aplikasi/Ask Question.png',
      text: 'Aksara',
      route: '/aksara',
    ),

    // Tambahkan item-menu lainnya di sini
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Menu"),
        ),
        body: _buildList(context));
  }

  Widget _buildList(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  // context.push('/menulis');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Menulis()),
                  );
                },
                child: Container(
                  height: 200,
                  width: 80,
                  color: Colors.red,
                ),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Container(
              height: 500,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 6/4,
                  crossAxisSpacing: 8.0, // Adjust spacing as needed
                  mainAxisSpacing: 8.0, // Adjust spacing as needed
                ),
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  return MenuWidget(
                    key: Key(menuItems[index].text),
                    imagePath: menuItems[index].imagePath,
                    text: menuItems[index].text,
                    onTap: () {
                      context.push(menuItems[index].route);
                    },
                  );
                }
              ),
            ),
          
          ],
        ),
      ],
    );
  }
}
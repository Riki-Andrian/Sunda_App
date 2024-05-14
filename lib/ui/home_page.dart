import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sunda_app/data/model/menu_item.dart';
import 'package:sunda_app/ui/testocr.dart';
import 'package:sunda_app/widget/menu_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

    List<MenuItem> menuItems = [
    MenuItem(
      iconData: Icons.ac_unit,
      text: 'Konversi',
      route: '/konversi',
    ),
    MenuItem(
      iconData: Icons.access_alarm,
      text: 'Terjemahan',
      route: '/translate',
    ),
    MenuItem(
      iconData: Icons.access_time,
      text: 'Kamus',
      route: '/kamus',
    ),
        MenuItem(
      iconData: Icons.access_time,
      text: 'Pupuh',
      route: '/pupuh',
    ),
        MenuItem(
      iconData: Icons.access_time,
      text: 'Peribahasa',
      route: '/peribahasa',
    ),
        MenuItem(
      iconData: Icons.access_time,
      text: 'Penulisan',
      route: '/menulis',
    ),
        MenuItem(
      iconData: Icons.access_time,
      text: 'Qiuiz',
      route: '/quizmenu',
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
                    MaterialPageRoute(builder: (context) => TestOcr()),
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
                    iconData: menuItems[index].iconData,
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

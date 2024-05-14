import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sunda_app/ui/testocr.dart';
import 'package:sunda_app/widget/menu_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                  crossAxisSpacing: 8.0, // Adjust spacing as needed
                  mainAxisSpacing: 8.0, // Adjust spacing as needed
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return MenuWidget(
                      index); // Make sure MenuWidget is implemented correctly
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

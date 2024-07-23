import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:Nyunda/data/model/pupuh.dart';
import 'package:url_launcher/url_launcher.dart';

class PupuhDetaiPage extends StatelessWidget {
  final PupuhSunda pupuhSunda;

  const PupuhDetaiPage({super.key, required this.pupuhSunda});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pupuhSunda.nama),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: IconButton(
              icon: Icon(Icons.info),
              onPressed: () {
                _showDetail(context);
              },
            ),
          )
        ],
      ),
      body: _build(),
    );
  }

  Widget _build() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Lirik',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Flexible(
              child: ListView.builder(
                itemCount: pupuhSunda.lirik.versi1.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 4.0, left: 16),
                    child: Text(
                      pupuhSunda.lirik.versi1[index],
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Card(
                margin: EdgeInsets.all(4),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Pola Pupuh: ${pupuhSunda.polaSajak.join('-')}",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "Jumlah bait: ${pupuhSunda.jumlahSukuKataPerBaris.join('-')}",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "Sifat: ${pupuhSunda.watak}",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton(onPressed: () {
              _launchUrl(pupuhSunda.link);
            }, child: Text("Link Video", style: TextStyle(fontSize: 20),)),
            SizedBox(
              height: 200,
            )
          ],
        ),
      ),
    );
  }

  void _showDetail(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  margin: EdgeInsets.all(4),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Pola Pupuh: ${pupuhSunda.polaSajak.join('-')}",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          "Jumlah bait: ${pupuhSunda.jumlahSukuKataPerBaris.join('-')}",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

Future<void> _launchUrl(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(
    uri,
    mode: LaunchMode.externalApplication,
  )) {
    throw "Tidak bisa membuka link";
  }
}

}

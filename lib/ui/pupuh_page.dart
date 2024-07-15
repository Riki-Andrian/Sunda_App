import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sunda_app/data/model/pupuh.dart';
import 'package:sunda_app/ui/pupuh_detail.dart';

class PupuhPage extends StatelessWidget {
  const PupuhPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pupuh"),
      ),
      body: _build(context),
    );
  }

  Widget _build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Pupuh>(
        future: readJsonData(),
        builder: (context, AsyncSnapshot<Pupuh> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List<PupuhSunda> pupuh = snapshot.data!.pupuhSunda;
            return ListView.builder(
              itemCount: pupuh.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PupuhDetaiPage(pupuhSunda: pupuh[index]),));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Card(
                      child: ListTile(
                        title: Text(pupuh[index].nama),
                      ),
                    ),
                  ),
                );
              },
            );
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<Pupuh> readJsonData() async {
    final jsondata = await rootBundle.loadString('assets/pupuh.json');
    final jsonDataMap = json.decode(jsondata);
    return Pupuh.fromJson(jsonDataMap);
  }
}

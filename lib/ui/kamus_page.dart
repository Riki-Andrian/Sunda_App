import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sunda_app/data/model/kamus.dart';
import 'package:sunda_app/widget/kamus_widget.dart';

class KamusPage extends StatelessWidget {
  const KamusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return _build(context);
  }

  Widget _build(BuildContext context){
    return Scaffold(
      body: FutureBuilder(
        future: ReadJsonData(), 
        builder: (context, data) {
          if(data.hasError){
            return Center(
              child: Text("${data.error}"),
            );
          }else if(data.hasData){
            var items = data.data as List<Kamus>;
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) => KamusWidget(kamus: items[index]),

               );
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        )
    ); 
  }

  Future<List<Kamus>>ReadJsonData() async{
    final jsondata = await rootBundle.loadString('assets/kamus_tb.json');
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => Kamus.fromJson(e)).toList();
  }
}
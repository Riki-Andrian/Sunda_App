import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sunda_app/data/model/peribahasa.dart';
import 'package:sunda_app/widget/peribahasa_widget.dart';

class PeribahasaPage extends StatelessWidget {

  const PeribahasaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Peribahasa"),
      ),
       body: _build(context),
    );
    
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
            var items = data.data as List<Peribahasa>;
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) => PeribahasaWidget(peribahasa: items[index]),

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

  Future<List<Peribahasa>>ReadJsonData() async{
    final jsondata = await rootBundle.loadString('assets/peribahasa_tb.json');
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => Peribahasa.fromJson(e)).toList();
  }

}
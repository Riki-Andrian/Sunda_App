import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:Nyunda/data/model/peribahasa.dart';
import 'package:Nyunda/widget/peribahasa_widget.dart';

class PeribahasaPage extends StatefulWidget {
  const PeribahasaPage({super.key});

  @override
  State<PeribahasaPage> createState() => _PeribahasaPageState();
}

class _PeribahasaPageState extends State<PeribahasaPage> {
  TextEditingController _searchController = TextEditingController();
  List<Peribahasa> _peribahasaList = [];
  List<Peribahasa> _filteredPeribahasaList = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final jsondata = await rootBundle.loadString('assets/peribahasa_tb.json');
    final list = json.decode(jsondata) as List<dynamic>;

    setState(() {
      _peribahasaList = list.map((e) => Peribahasa.fromJson(e)).toList();
      _filteredPeribahasaList = List.from(_peribahasaList);
    });
  }

  void _filterPeribahasa(String query) {
    setState(() {
      if (query.isNotEmpty) {
        _filteredPeribahasaList = _peribahasaList
            .where((peribahasa) =>
                peribahasa.peribahasa
                    .toLowerCase()
                    .contains(query.toLowerCase()) ||
                peribahasa.makna.toLowerCase().contains(query.toLowerCase()))
            .toList();
      } else {
        _filteredPeribahasaList = List.from(_peribahasaList);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Peribahasa"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              key: Key("peribahasaSrc"),
              controller: _searchController,
              onChanged: _filterPeribahasa,
              decoration: InputDecoration(
                labelText: "Cari Peribahasa",
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(child: _build(context)),
        ],
      ),
    );
  }

  Widget _build(BuildContext context) {
    return _filteredPeribahasaList.isEmpty
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: _filteredPeribahasaList.length,
            itemBuilder: (context, index) =>
                PeribahasaWidget(peribahasa: _filteredPeribahasaList[index]),
          );
  }
}

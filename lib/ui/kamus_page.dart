import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:sunda_app/data/model/kamus.dart';
import 'package:sunda_app/widget/kamus_widget.dart';

class KamusPage extends StatefulWidget {
  const KamusPage({super.key});

  @override
  State<KamusPage> createState() => _KamusPageState();
}

class _KamusPageState extends State<KamusPage> {
  TextEditingController _searchController = TextEditingController();
  List<Kamus> _kamusList = [];
  List<Kamus> _filteredKamusList = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final jsondata = await rootBundle.loadString('assets/kamus_tb.json');
    final list = json.decode(jsondata) as List<dynamic>;

    setState(() {
      _kamusList = list.map((e) => Kamus.fromJson(e)).toList();
      // Saat ini, setiap kali data dimuat, kami menetapkan list terfilter ke seluruh daftar
      _filteredKamusList = List.from(_kamusList);
    });
  }

  void _filterKamus(String query) {
    setState(() {
      if (query.isNotEmpty) {
        _filteredKamusList = _kamusList
            .where((kamus) =>
                kamus.kamus_kata.toLowerCase().contains(query.toLowerCase()) ||
                kamus.kamus_arti.toLowerCase().contains(query.toLowerCase()))
            .toList();
      } else {
        // Jika query kosong, tampilkan seluruh daftar
        _filteredKamusList = List.from(_kamusList);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kamus"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: _filterKamus,
              decoration: InputDecoration(
                labelText: "Cari Arti",
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
    return _filteredKamusList.isEmpty
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: _filteredKamusList.length,
            itemBuilder: (context, index) =>
                KamusWidget(kamus: _filteredKamusList[index]),
          );
  }
}

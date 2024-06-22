import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sunda_app/data/model/quiz.dart';
import 'package:sunda_app/helper/boxes.dart';
import 'package:sunda_app/ui/quiz_page.dart';
import 'package:sunda_app/ui/riwayat_quiz.dart';

import '../data/model/hasil.dart';

class QuizDetailLevelPage extends StatelessWidget {
  final Level level;
  const QuizDetailLevelPage({Key? key, required this.level}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level ${level.level}'),
      ),
      body: _build(context),
    );
  }

  Widget _build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: _buildRiwayatList(context, level.level)),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context as BuildContext,
                  MaterialPageRoute(
                    builder: (context) => QuizPage(level: level),
                  ));
            },
            child: Text('Mulai Quiz'))
      ],
    );
  }

  Widget _buildRiwayatList(BuildContext context, int level) {
    return ValueListenableBuilder<Box<Hasil>>(
      valueListenable: boxHasil.listenable() as ValueListenable<Box<Hasil>>,
      builder: (context, box, _) {
        final riwayat =
            box.values.where((hasil) => hasil.level == level).toList();
        if (riwayat.isEmpty) {
          return Center(
            child: Text("Kosong"),
          );
        } else {
          return ListView.builder(
            itemCount: riwayat.length,
            itemBuilder: (context, index) {
              final hasil = riwayat[index];
              return ListTile(
                title: Text('Skor: ${hasil.score}'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RiwayatQuiz(hasil: hasil),
                      ));
                },
              );
            },
          );
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sunda_app/data/model/quiz.dart';
import 'package:sunda_app/data/model/hasil.dart';
import 'package:sunda_app/ui/quiz_page.dart';
import 'package:sunda_app/ui/riwayat_quiz.dart';

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
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          height: 75,
        ),
        Expanded(child: _buildRiwayatList(context, level.level)),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QuizPage(level: level),
                ),
              );
            },
            child: Text('Mulai Quiz'),
          ),
        ),
        SizedBox(
          height: 200,
        )
      ],
    );
  }

  Widget _buildRiwayatList(BuildContext context, int level) {
    final hasilBox = Hive.box<Hasil>('hasilBox');

    return ValueListenableBuilder<Box<Hasil>>(
      valueListenable: hasilBox.listenable(),
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
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Card(
                  child: ListTile(
                    title: Text('Skor: ${hasil.score}'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RiwayatQuiz(hasil: hasil),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}

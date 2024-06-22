import 'package:flutter/material.dart';
import 'package:sunda_app/data/model/hasil.dart';

class RiwayatQuiz extends StatelessWidget {
  final Hasil hasil;

  const RiwayatQuiz({Key? key, required this.hasil}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Hasil'),
      ),
      body: ListView.builder(
        itemCount: hasil.questions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(hasil.questions[index]),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Jawaban: ${hasil.selectedAnswers[index]}'),
                Text(
                  hasil.isCorrect[index] ? 'Benar' : 'Salah',
                  style: TextStyle(color: hasil.isCorrect[index] ? Colors.green : Colors.red),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

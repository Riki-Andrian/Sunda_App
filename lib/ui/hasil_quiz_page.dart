import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sunda_app/data/model/quiz.dart';

class HasilQuiz extends StatelessWidget {
  final List<Question> questions;
  final List<int> selectedOptions;
  
  const HasilQuiz({Key? key, required this.questions, required this.selectedOptions}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hasil"),
      ),
      body: _build(),
    );
  }

  Widget _build(){
    return ListView.builder(
      itemCount: questions.length,
      itemBuilder: (context, index) {
        final question = questions[index];
        final selectedOptionIndex = selectedOptions[index];
        final selectedOption = selectedOptionIndex != -1 ? question.options[selectedOptionIndex] : null;
        final correctOption = question.options.firstWhere((option) => option.isCorrect);
        final isCorrect = selectedOption?.isCorrect ?? false;

        return Card(
          margin: EdgeInsets.all(12.0),
          child: ListTile(
            title: Text(question.question),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Selected: ${selectedOption?.option ?? "None"}'),
                Text('Correct: ${correctOption.option}'),
                Text(
                  isCorrect? 'Correct' : 'Incorrect',
                  style: TextStyle(color: isCorrect ? Colors.green : Colors.red),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
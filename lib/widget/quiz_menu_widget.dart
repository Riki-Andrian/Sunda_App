import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sunda_app/data/model/quiz.dart';

class QuizMenuWidget extends StatelessWidget {
  final Level level;

  const QuizMenuWidget({Key? key, required this.level}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _build();
  }

  Widget _build(){
    return Padding(
      padding: EdgeInsets.all(4),
      child: Container(
        child: Center(
          child: Text(
               'Quiz Level ${level.level}',
               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
               textAlign: TextAlign.center,
             ),
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(8)
        ),
      ),
       );
  }
}
import 'package:flutter/material.dart';
import 'package:sunda_app/data/model/quiz.dart';

class QuizMenuWidget extends StatelessWidget {
  final Level level;
  final bool isLocked;

  const QuizMenuWidget({Key? key, required this.level, required this.isLocked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _build();
  }

  Widget _build(){
    return Padding(
      padding: EdgeInsets.all(4),
      child: Card(
        color: isLocked? Colors.transparent : Colors.white,
        child: Center(
          child: Text(
               'Quiz Level ${level.level}',
               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
               textAlign: TextAlign.center,
             ),
        ),
      ),
       );
  }
}
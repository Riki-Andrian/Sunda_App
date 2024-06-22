import 'package:hive/hive.dart';

part 'hasil.g.dart';

@HiveType(typeId: 0)
class Hasil extends HiveObject {
  @HiveField(0)
  int level;

  @HiveField(1)
  int score;

  @HiveField(2)
  List<String> questions;

  @HiveField(3)
  List<String> selectedAnswers;

  @HiveField(4)
  List<bool> isCorrect;

  Hasil({
    required this.level,
    required this.score,
    required this.questions,
    required this.selectedAnswers,
    required this.isCorrect,
  });
}

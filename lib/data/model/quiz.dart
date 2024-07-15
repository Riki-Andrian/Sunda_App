// To parse this JSON data, do
//
//     final quiz = quizFromJson(jsonString);

//import 'dart:convert';

class Quiz {
  final List<Level> levels;

  Quiz({required this.levels});

  factory Quiz.fromJson(Map<String, dynamic> json) {
    List<dynamic> levelList = json['levels'];
    List<Level> parsedLevels = levelList.map((level) => Level.fromJson(level)).toList();
    return Quiz(levels: parsedLevels);
  }
}

class Level {
  final int level;
  final List<Question> questions;

  Level({required this.level, required this.questions});

  factory Level.fromJson(Map<String, dynamic> json) {
    List<dynamic> questionList = json['questions'];
    List<Question> parsedQuestions = questionList.map((question) => Question.fromJson(question)).toList();
    return Level(
      level: json['level'],
      questions: parsedQuestions,
    );
  }
}

class Question {
  final int id;
  final String question;
  final List<Option> options;

  Question({required this.id, required this.question, required this.options});

  factory Question.fromJson(Map<String, dynamic> json) {
    List<dynamic> optionList = json['options'];
    List<Option> parsedOptions = optionList.map((option) => Option.fromJson(option)).toList();
    return Question(
      id: json['id'],
      question: json['question'],
      options: parsedOptions,
    );
  }
}

class Option {
  final String option;
  final bool isCorrect;

  Option({required this.option, required this.isCorrect});

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      option: json['option'],
      isCorrect: json['is_correct'],
    );
  }
}
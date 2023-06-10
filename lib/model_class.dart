// To parse this JSON data, do
//
//     final modelClass = modelClassFromJson(jsonString);

import 'dart:convert';

List<ModelClass> modelClassFromJson(String str) =>
    List<ModelClass>.from(json.decode(str).map((x) => ModelClass.fromJson(x)));

String modelClassToJson(List<ModelClass> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModelClass {
  String category;
  Type type;
  Difficulty difficulty;
  String question;
  CorrectAnswer correctAnswer;
  List<CorrectAnswer> incorrectAnswers;

  ModelClass({
    required this.category,
    required this.type,
    required this.difficulty,
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
  });

  factory ModelClass.fromJson(Map<String, dynamic> json) => ModelClass(
        category: json["category"],
        type: typeValues.map[json["type"]]!,
        difficulty: difficultyValues.map[json["difficulty"]]!,
        question: json["question"],
        correctAnswer: correctAnswerValues.map[json["correct_answer"]]!,
        incorrectAnswers: List<CorrectAnswer>.from(
            json["incorrect_answers"].map((x) => correctAnswerValues.map[x]!)),
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "type": typeValues.reverse[type],
        "difficulty": difficultyValues.reverse[difficulty],
        "question": question,
        "correct_answer": correctAnswerValues.reverse[correctAnswer],
        "incorrect_answers": List<dynamic>.from(
            incorrectAnswers.map((x) => correctAnswerValues.reverse[x])),
      };
}

enum CorrectAnswer { TRUE, FALSE }

final correctAnswerValues =
    EnumValues({"False": CorrectAnswer.FALSE, "True": CorrectAnswer.TRUE});

enum Difficulty { MEDIUM, EASY }

final difficultyValues =
    EnumValues({"easy": Difficulty.EASY, "medium": Difficulty.MEDIUM});

enum Type { BOOLEAN }

final typeValues = EnumValues({"boolean": Type.BOOLEAN});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

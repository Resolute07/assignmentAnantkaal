import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model_class.dart';

class QuestionGenerator {
  static List<ModelClass> results = [];
  static List<String> questions = [];

  static Future<void> getData() async {
    List<ModelClass> resultData = [];
    final http.Response response = await http
        .get(Uri.parse('https://opentdb.com/api.php?amount=10&type=boolean'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      for (Map<String, dynamic> result in data['results']) {
        resultData.add(ModelClass.fromJson(result));
      }
      results = resultData;
    } else {
      results = resultData;
    }
  }

  void shuffleQuestions() {
    results.shuffle();
  }

  static void generateQuestionCard() {
    for (ModelClass element in results) {
      questions.add(element.question);
    }
  }
}

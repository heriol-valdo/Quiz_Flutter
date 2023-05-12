import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart' show rootBundle;
import 'package:quiz/models/quiz.dart';

class QuizService {
  Future<List<Quiz>> loadJsonData() async {
    String jsonData = await rootBundle.loadString('assets/JSON/jsonapi.json');
    List<dynamic> jsonList = json.decode(jsonData);
    return jsonList.map((json) => Quiz.fromJson(json)).toList();
  }
}

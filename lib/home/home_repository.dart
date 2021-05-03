import 'dart:convert';

import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:devquiz/shared/models/user_model.dart';
import 'package:flutter/services.dart';

class HomeRepository {
  Future<UserModel> getUser() async {
    final response = await rootBundle.loadString("assets/database/users.json");
    return UserModel.fromJson(response);
  }

  Future<List<QuizModel>> getQuizzes({required List<String> levels}) async {
    final response =
        await rootBundle.loadString("assets/database/quizzes.json");
    final map = jsonDecode(response) as Map;
    final list = map["quizzes"] as List;
    final quizzes = list.map((e) => QuizModel.fromMap(e)).toList();

    return quizzes.where((i) {
      List<String> splitedString = i.level.toString().split('.');
      return levels.contains(splitedString[1]);
    }).toList();
  }
}

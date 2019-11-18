import 'package:flappy_capitals/core/models/quiz_type.dart';
import 'package:flappy_capitals/ui/home/home.dart';
import 'package:flappy_capitals/ui/quiz/quiz.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case QuizScreen.routeName:
        QuizType quizType = QuizType.easy;
        if (routeSettings.arguments is QuizType) {
          quizType = routeSettings.arguments;
        }
        return MaterialPageRoute(
          builder: (BuildContext context) => QuizScreen(
            quizType: quizType,
          ),
        );
        break;
      default:
        return MaterialPageRoute(
          builder: (BuildContext context) => Home(),
        );
        break;
    }
  }
}

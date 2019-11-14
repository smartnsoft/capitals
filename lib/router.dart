import 'package:flappy_capitals/ui/quiz/easy_quiz/easy_quiz.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case EasyQuiz.routeName:
        return MaterialPageRoute(
          builder: (BuildContext context) => EasyQuiz(),
        );
        break;
    }
  }
}

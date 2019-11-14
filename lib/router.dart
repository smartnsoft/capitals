import 'package:flappy_capitals/ui/quiz/quiz.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case QuizScreen.routeName:
        return MaterialPageRoute(
          builder: (BuildContext context) => QuizScreen(),
        );
        break;
    }
  }
}

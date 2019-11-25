import 'package:flappy_capitals/core/models/quiz_type.dart';
import 'package:flappy_capitals/core/models/score.dart';
import 'package:flappy_capitals/ui/home/home.dart';
import 'package:flappy_capitals/ui/quiz/quiz.dart';
import 'package:flappy_capitals/ui/quiz/result/result.dart';
import 'package:flappy_capitals/ui/search_screen/search_screen.dart';
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
      case ResultScreen.routeName:
        Score score = Score(points: 0, maxPoints: 0);
        if (routeSettings.arguments is Score) {
          score = routeSettings.arguments;
        }
        return MaterialPageRoute(
          builder: (BuildContext context) => ResultScreen(
            score: score,
          ),
        );
        break;
      case SearchScreen.routeName:
        return MaterialPageRoute(
          builder: (BuildContext context) => SearchScreen(),
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

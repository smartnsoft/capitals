import 'package:flappy_capitals/core/models/score.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  static const String routeName = "ResultScreen";

  final Score score;

  const ResultScreen({
    Key key,
    this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("score : ${score.points} / ${score.maxPoints}"),
        ),
      ),
    );
  }
}

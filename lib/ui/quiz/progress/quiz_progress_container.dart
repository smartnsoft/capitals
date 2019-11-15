import 'package:flutter/material.dart';

class QuizProgressContainer extends StatelessWidget {
  final Widget child;

  const QuizProgressContainer({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    );
  }
}

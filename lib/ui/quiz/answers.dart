import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  final List<String> choices;

  const Answers({
    Key key,
    this.choices,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 150,
      color: Colors.amber,
    );
  }
}

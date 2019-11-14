import 'package:flappy_capitals/ui/app_theme.dart';
import 'package:flutter/material.dart';

class EasyQuiz extends StatelessWidget {
  static const String routeName = "EasyQUiz";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.of(context).colors.primary,
    );
  }
}

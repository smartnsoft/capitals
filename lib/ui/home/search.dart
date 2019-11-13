import 'package:flappy_capitals/ui/app_theme.dart';
import 'package:flappy_capitals/utils.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: Utils.isBigScreen(context)
          ? AppTheme.of(context).values.bigSearchWidth
          : AppTheme.of(context).values.smallSearchWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
    );
  }
}

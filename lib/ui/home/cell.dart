import 'package:flappy_capitals/ui/app_theme.dart';
import 'package:flappy_capitals/utils.dart';
import 'package:flutter/material.dart';

class Cell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double bigCardWidth = AppTheme.of(context).values.bigCellWidth;
    final double bigCardHeight = AppTheme.of(context).values.bigCellHeight;

    final double smallCardWidth = AppTheme.of(context).values.smallCellWidth;
    final double smallCardHeight = AppTheme.of(context).values.smallCellHeight;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: Utils.isBigScreen(context) ? bigCardHeight : smallCardHeight,
        width: Utils.isBigScreen(context) ? bigCardWidth : smallCardWidth,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}

import 'package:flappy_capitals/ui/app_theme.dart';
import 'package:flappy_capitals/utils.dart';
import 'package:flutter/material.dart';

class Cell extends StatelessWidget {
  final Icon icon;
  final String difficulty;
  final String description;

  const Cell({
    Key key,
    this.icon,
    this.difficulty,
    this.description,
  }) : super(key: key);

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
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: _buildContent(
            context,
            icon,
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, Icon icon) {
    final List<Widget> texts = [
      Text(
        difficulty,
        style: AppTheme.of(context).textStyles.bigBlackText,
      ),
      Text(
        description,
        style: AppTheme.of(context).textStyles.mediumBlackText,
      ),
    ];
    if (Utils.isBigScreen(context)) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Center(
              child: icon,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: texts,
            ),
          ),
        ],
      );
    } else {
      return Row(
        children: <Widget>[
          Expanded(
            child: Center(
              child: icon,
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: texts,
            ),
          ),
        ],
      );
    }
  }
}

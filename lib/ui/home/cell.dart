import 'package:flappy_capitals/ui/app_theme.dart';
import 'package:flappy_capitals/utils.dart';
import 'package:flutter/material.dart';

class Cell extends StatelessWidget {
  final String imageAssetPath;
  final String difficulty;
  final String description;
  final VoidCallback onTap;

  const Cell({
    Key key,
    this.imageAssetPath,
    this.difficulty,
    this.description,
    this.onTap,
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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {
              if (onTap != null) {
                onTap();
              }
            },
            child: _buildContent(
              context,
              imageAssetPath,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, String imageAssetPath) {
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
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  imageAssetPath,
                  height: 50,
                  width: 50,
                ),
              ),
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
              child: Image.asset(
                imageAssetPath,
                height: 50,
                width: 50,
              ),
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

import 'package:flappy_capitals/core/models/score.dart';
import 'package:flappy_capitals/ui/app_theme.dart';
import 'package:flutter/material.dart';

class ScoreWidget extends StatelessWidget {
  final Score score;

  const ScoreWidget({
    Key key,
    this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "${score.points}",
              style: AppTheme.of(context).textStyles.scoreStyleText,
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          "/${score.maxPoints}",
          style: AppTheme.of(context).textStyles.maxPointsStyleText,
        ),
      ],
    );
  }
}

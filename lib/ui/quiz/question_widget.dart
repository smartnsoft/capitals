import 'package:flappy_capitals/core/i18n.dart';
import 'package:flappy_capitals/ui/app_theme.dart';
import 'package:flappy_capitals/ui/quiz/progress_bar.dart';
import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  final String countryName;

  const QuestionWidget({
    Key key,
    this.countryName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          I18n.of(context).country,
          style: AppTheme.of(context).textStyles.mediumWhiteLabel.copyWith(color: AppTheme.of(context).colors.appBlack),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          countryName,
          style: AppTheme.of(context).textStyles.bigScreenTitle,
        ),
        SizedBox(
          height: 15,
        ),
        ProgressBar(),
      ],
    );
  }
}

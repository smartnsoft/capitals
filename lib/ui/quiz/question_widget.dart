import 'package:auto_size_text/auto_size_text.dart';
import 'package:flappy_capitals/core/i18n.dart';
import 'package:flappy_capitals/ui/app_theme.dart';
import 'package:flappy_capitals/ui/quiz/progress/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
          style: AppTheme.of(context).textStyles.mediumWhiteLabel.copyWith(
                color: AppTheme.of(context).colors.appBlack,
              ),
        ),
        SizedBox(
          height: 15,
        ),
        AutoSizeText(
          countryName,
          style: AppTheme.of(context)
              .textStyles
              .bigScreenTitle
              .copyWith(fontSize: MediaQuery.of(context).size.height * .05),
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          minFontSize: 20,
        ),
        SizedBox(
          height: 15,
        ),
        ProgressBar(),
      ],
    );
  }
}

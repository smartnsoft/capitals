import 'package:flappy_capitals/core/i18n.dart';
import 'package:flappy_capitals/core/models/score.dart';
import 'package:flappy_capitals/ui/app_theme.dart';
import 'package:flappy_capitals/ui/quiz/result/score_widget.dart';
import 'package:flappy_capitals/ui/shared/responsive_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ResultScreen extends StatelessWidget {
  static const String routeName = "ResultScreen";

  final Score score;

  const ResultScreen({
    Key key,
    this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.of(context).colors.primary,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(
            AppTheme.of(context).values.progressContainerBorderSize +
                AppTheme.of(context).values.paddingInsideProgressContainer,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ResponsiveButton(
                onTap: () {
                  Navigator.of(context).pop();
                },
                icon: Image.asset(
                  AppTheme.of(context).images.icClose,
                  height: 20,
                  width: 20,
                ),
                text: Text(
                  I18n.of(context).close,
                  style: AppTheme.of(context).textStyles.mediumWhiteLabel,
                ),
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: CircularPercentIndicator(
                      radius: 150,
                      lineWidth: 5,
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: AppTheme.of(context).colors.primaryAccent,
                      animation: true,
                      animationDuration: 2000,
                      backgroundColor: Colors.transparent,
                      percent: score.points / score.maxPoints,
                      center: ScoreWidget(
                        score: score,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

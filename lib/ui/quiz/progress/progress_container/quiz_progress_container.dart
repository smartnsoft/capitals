import 'dart:ui';

import 'package:flappy_capitals/core/blocs/progress_bloc/bloc.dart';
import 'package:flappy_capitals/ui/app_theme.dart';
import 'package:flappy_capitals/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'quiz_progress_painter.dart';

class QuizProgressContainer extends StatefulWidget {
  final Widget child;

  const QuizProgressContainer({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  _QuizProgressContainerState createState() => _QuizProgressContainerState();
}

class _QuizProgressContainerState extends State<QuizProgressContainer> with SingleTickerProviderStateMixin {
  double _percentage;
  double _nextPercentage;
  AnimationController _progressAnimationController;

  Widget get child => widget.child;

  @override
  void initState() {
    super.initState();
    _percentage = 0.0;
    _nextPercentage = 0.0;
    _initAnimationController();
  }

  _initAnimationController() {
    _progressAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: ProgressBloc.INCREMENTED_TIME_IN_MS),
    )..addListener(
        () {
          setState(() {
            _percentage = lerpDouble(
              _percentage,
              _nextPercentage,
              _progressAnimationController.value,
            );
          });
        },
      );
  }

  @override
  dispose() {
    _progressAnimationController.dispose();
    super.dispose();
  }

  _publishProgress(double progressionInSeconds, int maxDurationInSeconds) {
    setState(() {
      _percentage = _nextPercentage;
      _nextPercentage = progressionInSeconds / maxDurationInSeconds;
      _progressAnimationController.forward(from: 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (Utils.isBigScreen(context)) return child;
    Utils.makeStatusBarNormal(color: AppTheme.of(context).colors.primaryAccent);
    return BlocListener(
      bloc: BlocProvider.of<ProgressBloc>(context),
      listener: (BuildContext context, ProgressState state) {
        if (state is TimerProgressed) {
          setState(() {
            _publishProgress(
              state.progressionInMilliseconds,
              state.maxDurationInMilliseconds,
            );
          });
        }
      },
      child: SafeArea(
        child: CustomPaint(
          painter: QuizProgressPainter(
            defaultColor: AppTheme.of(context).colors.primaryAccent,
            containerBackground: AppTheme.of(context).colors.primary,
            borderSize: AppTheme.of(context).values.progressContainerBorderSize,
            progressColor: Colors.white,
            progress: _percentage,
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(
                AppTheme.of(context).values.paddingInsideProgressContainer,
              ),
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

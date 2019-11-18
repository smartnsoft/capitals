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
      duration: Duration(milliseconds: 30),
    )..addListener(() {
        setState(() {
          _percentage = lerpDouble(_percentage, _nextPercentage, _progressAnimationController.value);
        });
      });
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
      _progressAnimationController.forward(from: _percentage);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (Utils.isBigScreen(context)) return widget.child;
    return BlocListener(
      bloc: BlocProvider.of<ProgressBloc>(context),
      listener: (BuildContext context, ProgressState state) {
        if (state is TimerProgressed) {
          setState(() {
            _publishProgress(state.progressionInMilliseconds, state.maxDurationInMilliseconds);
          });
        }
      },
      child: CustomPaint(
        size: Size.infinite,
        painter: QuizProgressPainter(
          defaultColor: AppTheme.of(context).colors.primaryAccent,
          containerBackground: AppTheme.of(context).colors.primary,
          progressColor: Colors.white,
          progress: _percentage,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}

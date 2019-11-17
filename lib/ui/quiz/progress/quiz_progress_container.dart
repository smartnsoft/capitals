import 'dart:ui';

import 'package:flappy_capitals/core/blocs/progress_bloc/bloc.dart';
import 'package:flappy_capitals/ui/app_theme.dart';
import 'package:flappy_capitals/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizProgressContainer extends StatefulWidget {
  final Widget child;

  const QuizProgressContainer({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  _QuizProgressContainerState createState() => _QuizProgressContainerState();
}

class _QuizProgressContainerState extends State<QuizProgressContainer>
    with SingleTickerProviderStateMixin {
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
      duration: Duration(milliseconds: 10000),
    )..addListener(() {
        setState(() {
          _percentage = lerpDouble(_percentage, _nextPercentage, _progressAnimationController.value);
        });
      });
  }

  _publishProgress(int progressionInSeconds, int maxDurationInSeconds) {
    setState(() {
      _percentage = _nextPercentage;
      _nextPercentage = progressionInSeconds / maxDurationInSeconds;
      _progressAnimationController.forward(from: _nextPercentage);
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
            _publishProgress(state.progressionInSeconds, state.maxDurationInSeconds);
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

class QuizProgressPainter extends CustomPainter {
  final Color defaultColor;
  final Color containerBackground;
  final Color progressColor;
  final double progress;

  QuizProgressPainter({
    this.defaultColor,
    this.containerBackground,
    this.progressColor,
    this.progress,
  });

  Paint getPaint(Color color) {
    return Paint()
      ..color = color
      ..style = PaintingStyle.stroke;
  }

  @override
  void paint(Canvas canvas, Size size) {
    /// Draw default rectangle
    final paint = Paint();
    final double borderSize = 20;
    paint.color = defaultColor;
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);

    canvas.drawRect(rect, paint);

    /// Draw container background
    paint.color = containerBackground;
    final a = Rect.fromLTWH(
        borderSize, borderSize, size.width - borderSize * 2, size.height - borderSize * 2);

    canvas.drawRect(a, paint);

    paint.color = progressColor;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = borderSize * 2;

    double progressToDraw = progress;
    final double totalPerimeter = (size.width + size.height) * 2;
    final double horizontalLinePercent = size.width / totalPerimeter;
    final double verticalLinePercent = size.height / totalPerimeter;

    if (progressToDraw < horizontalLinePercent && progressToDraw > 0) {
      canvas.drawLine(
        Offset(0, 0),
        Offset(progressToDraw * totalPerimeter, 0),
        paint,
      );
    } else if (progressToDraw > 0) {
      canvas.drawLine(
        Offset(0, 0),
        Offset(size.width, 0),
        paint,
      );

      progressToDraw -= horizontalLinePercent;

      if (progressToDraw < verticalLinePercent && progressToDraw > 0) {
        canvas.drawLine(
          Offset(size.width, 0),
          Offset(size.width, progressToDraw * size.height),
          paint,
        );
      } else if (progressToDraw > 0) {
        canvas.drawLine(
          Offset(size.width, 0),
          Offset(size.width, size.height),
          paint,
        );

        progressToDraw -= verticalLinePercent;
        if (progressToDraw < horizontalLinePercent && progressToDraw > 0) {
          canvas.drawLine(
            Offset(size.width, size.height),
            Offset(
              size.width - (progressToDraw / horizontalLinePercent * size.width),
              size.height,
            ),
            paint,
          );
        } else if (progressToDraw > 0) {
          canvas.drawLine(
            Offset(size.width, size.height),
            Offset(0, size.height),
            paint,
          );

          progressToDraw -= horizontalLinePercent;
          if (progressToDraw < verticalLinePercent && progressToDraw > 0) {
            canvas.drawLine(
              Offset(0, size.height),
              Offset(0, size.height - (progressToDraw / horizontalLinePercent * size.height)),
              paint,
            );
          } else if (progressToDraw > 0) {
            canvas.drawLine(
              Offset(0, size.height),
              Offset(0, 0),
              paint,
            );
          }
        }
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

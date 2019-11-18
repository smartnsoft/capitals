import 'package:flutter/material.dart';

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
    final a = Rect.fromLTWH(borderSize, borderSize, size.width - borderSize * 2, size.height - borderSize * 2);

    canvas.drawRect(a, paint);

    paint.color = progressColor;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = borderSize * 2;

    double progressToDraw = progress;
    final double totalPerimeter = (size.width + size.height) * 2;
    final double horizontalLinePercent = size.width / totalPerimeter;
    final double verticalLinePercent = size.height / totalPerimeter;

    print("PROGRESS TO DRAW = $progressToDraw");
    print("horizontalLinePercent : $horizontalLinePercent");
    print("verticalLinePercent : $verticalLinePercent");
    if (progressToDraw <= horizontalLinePercent && progressToDraw > 0) {
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

      if (progressToDraw <= verticalLinePercent && progressToDraw > 0) {
        canvas.drawLine(
          Offset(size.width, 0),
          Offset(size.width, progressToDraw * totalPerimeter),
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
              size.width - (progressToDraw * totalPerimeter),
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
              Offset(0, size.height - (progressToDraw * totalPerimeter)),
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

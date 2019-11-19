import 'package:delayed_display/delayed_display.dart';
import 'package:flappy_capitals/core/i18n.dart';
import 'package:flappy_capitals/core/models/quiz_type.dart';
import 'package:flappy_capitals/ui/app_theme.dart';
import 'package:flappy_capitals/ui/home/cell.dart';
import 'package:flappy_capitals/ui/home/header.dart';
import 'package:flappy_capitals/ui/quiz/quiz.dart';
import 'package:flappy_capitals/utils.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.of(context).colors.primary,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          height: _getScrollableHeight(context),
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    child: DelayedDisplay(
                      delay: Duration(milliseconds: 200),
                      child: Header(),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * AppTheme.of(context).values.headerHeightRatio -
                    AppTheme.of(context).values.cellsOverflow,
                left: 0,
                right: 0,
                bottom: 0,
                child: _buildCells(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCells(BuildContext context) {
    final List<Widget> cells = [
      DelayedDisplay(
        delay: Duration(milliseconds: 400),
        child: Cell(
          imageAssetPath: AppTheme.of(context).images.easy,
          difficulty: I18n.of(context).easy,
          description: I18n.of(context).easy_description,
          onTap: () {
            Navigator.of(context).pushNamed(
              QuizScreen.routeName,
              arguments: QuizType.easy,
            );
          },
        ),
      ),
      DelayedDisplay(
        delay: Duration(milliseconds: 600),
        child: Cell(
          imageAssetPath: AppTheme.of(context).images.medium,
          difficulty: I18n.of(context).medium,
          description: I18n.of(context).medium_description,
          onTap: () {
            Navigator.of(context).pushNamed(
              QuizScreen.routeName,
              arguments: QuizType.medium,
            );
          },
        ),
      ),
      DelayedDisplay(
        delay: Duration(milliseconds: 800),
        child: Cell(
          imageAssetPath: AppTheme.of(context).images.hard,
          difficulty: I18n.of(context).hard,
          description: I18n.of(context).hard_description,
        ),
      ),
    ];

    Widget cellsWidgets = Column(
      children: cells,
    );

    if (Utils.isBigScreen(context)) {
      cellsWidgets = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: cells,
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: Utils.isBigScreen(context) ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
      children: <Widget>[
        cellsWidgets,
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Image.asset(
            AppTheme.of(context).images.madeWithFlutter,
            height: AppTheme.of(context).values.madeWithFlutterHeight,
            width: 200,
          ),
        ),
      ],
    );
  }

  /// This function calculate the size of the scrollable area.
  /// On small devices, we may have to scroll in order to see all cells and bottom message.
  /// But as we are using a Stack, we have to make this little math to calculate the scrolling area.
  double _getScrollableHeight(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    if (Utils.isBigScreen(context)) return screenHeight;
    final double headerHeight = AppTheme.of(context).values.headerHeightRatio * screenHeight;
    final double cardsColumnHeight = AppTheme.of(context).values.smallCellHeight * 3 +
        AppTheme.of(context).values.bigCellsSpacing * 2 -
        AppTheme.of(context).values.cellsOverflow;

    final totalHeightTakenByWidgets =
        headerHeight + cardsColumnHeight + AppTheme.of(context).values.madeWithFlutterHeight + 30;
    return totalHeightTakenByWidgets < screenHeight ? screenHeight : totalHeightTakenByWidgets;
  }
}

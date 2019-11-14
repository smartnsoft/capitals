import 'package:flappy_capitals/core/i18n.dart';
import 'package:flappy_capitals/ui/app_theme.dart';
import 'package:flappy_capitals/ui/home/cell.dart';
import 'package:flappy_capitals/ui/home/header.dart';
import 'package:flappy_capitals/utils.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Widget _buildCells(BuildContext context) {
    final List<Widget> cells = [
      Cell(
        icon: Icon(Icons.call),
        difficulty: I18n.of(context).easy,
        description: I18n.of(context).easy_description,
      ),
      Cell(
        icon: Icon(Icons.call),
        difficulty: I18n.of(context).medium,
        description: I18n.of(context).medium_description,
      ),
      Cell(
        icon: Icon(Icons.call),
        difficulty: I18n.of(context).hard,
        description: I18n.of(context).hard_description,
      ),
    ];
    if (Utils.isBigScreen(context)) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: cells,
      );
    }

    return Column(
      children: cells,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.of(context).colors.primary,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
              minWidth: constraints.maxWidth,
            ),
            child: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: <Widget>[
                    Container(
                      color: Colors.white,
                      child: Header(),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * .4 - AppTheme.of(context).values.cardsOverflow,
                      left: 0,
                      right: 0,
                      child: _buildCells(context),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

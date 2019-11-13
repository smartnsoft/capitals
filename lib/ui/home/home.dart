import 'package:flappy_capitals/ui/app_theme.dart';
import 'package:flappy_capitals/ui/home/cell.dart';
import 'package:flappy_capitals/utils.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Widget _buildCells(BuildContext context) {
    if (Utils.isBigScreen(context)) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Cell(),
          Cell(),
          Cell(),
        ],
      );
    }

    return Column(
      children: <Widget>[
        Cell(),
        Cell(),
        Cell(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
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
                    child: Container(
                      height: MediaQuery.of(context).size.height * .4,
                      color: AppTheme.of(context).colors.pink,
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * .4 - 50,
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
    );
  }
}

import 'package:flappy_capitals/ui/app_theme.dart';
import 'package:flappy_capitals/utils.dart';
import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (!Utils.isBigScreen(context)) return Container();
    return Container(
      height: 20,
      width: 500,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          AnimatedContainer(
            padding: EdgeInsets.all(0),
            duration: Duration(seconds: 1),
            child: Container(
              width: 200,
              decoration: BoxDecoration(
                color: AppTheme.of(context).colors.primaryAccent,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

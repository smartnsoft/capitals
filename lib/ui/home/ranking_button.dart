import 'package:flappy_capitals/ui/app_theme.dart';
import 'package:flappy_capitals/utils.dart';
import 'package:flutter/material.dart';

class RankingButton extends StatelessWidget {
  Widget _buildContent(BuildContext context) {
    final Icon icon = Icon(
      Icons.show_chart,
      color: Colors.white,
    );

    if (Utils.isBigScreen(context)) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: icon,
          ),
          Expanded(
            child: Center(
              child: Text(
                "Ranking",
                style: AppTheme.of(context).textStyles.mediumWhiteLabel,
              ),
            ),
          ),
        ],
      );
    }

    return Center(child: icon);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: Utils.isBigScreen(context) ? 140 : 50,
      decoration: BoxDecoration(
          color: AppTheme.of(context).colors.primaryAccent,
          borderRadius: BorderRadius.circular(
            Utils.isBigScreen(context) ? 30 : 50,
          )),
      child: _buildContent(context),
    );
  }
}

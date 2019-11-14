import 'package:flappy_capitals/core/i18n.dart';
import 'package:flappy_capitals/ui/app_theme.dart';
import 'package:flappy_capitals/ui/home/ranking_button.dart';
import 'package:flappy_capitals/ui/home/search.dart';
import 'package:flappy_capitals/utils.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .4,
      color: AppTheme.of(context).colors.primary,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 40,
            right: 40,
            child: RankingButton(),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: AppTheme.of(context).values.cardsOverflow,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: Utils.isBigScreen(context) ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      I18n.of(context).good_morning,
                      style: AppTheme.of(context).textStyles.bigScreenTitle,
                    ),
                    Text(
                      I18n.of(context).lets_play,
                      style: AppTheme.of(context).textStyles.bigScreenTitle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Search(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

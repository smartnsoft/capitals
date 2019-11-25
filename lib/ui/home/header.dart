import 'package:delayed_display/delayed_display.dart';
import 'package:flappy_capitals/core/i18n.dart';
import 'package:flappy_capitals/ui/app_theme.dart';
import 'package:flappy_capitals/ui/home/search.dart';
import 'package:flappy_capitals/ui/shared/responsive_button.dart';
import 'package:flappy_capitals/utils.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final VoidCallback onSearchTap;

  const Header({
    Key key,
    this.onSearchTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .45,
      color: AppTheme.of(context).colors.primary,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            child: Image.asset(
              AppTheme.of(context).images.headerBackground,
            ),
          ),
          Positioned(
            top: 50,
            right: 30,
            child: DelayedDisplay(
              delay: Duration(milliseconds: 1000),
              slidingBeginOffset: Offset(0.35, 0),
              child: ResponsiveButton(
                icon: Icon(
                  Icons.show_chart,
                  color: Colors.white,
                ),
                text: Text(
                  I18n.of(context).ranking,
                  style: AppTheme.of(context).textStyles.mediumWhiteLabel,
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: AppTheme.of(context).values.cellsOverflow,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: Utils.isBigScreen(context) ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment:
                        Utils.isBigScreen(context) ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        I18n.of(context).good_morning,
                        style: Utils.isBigScreen(context)
                            ? AppTheme.of(context).textStyles.bigScreenTitle
                            : AppTheme.of(context).textStyles.mediumScreenTitle,
                      ),
                      Text(
                        I18n.of(context).lets_play,
                        style: Utils.isBigScreen(context)
                            ? AppTheme.of(context).textStyles.bigScreenTitle
                            : AppTheme.of(context).textStyles.mediumScreenTitle,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Search(
                    onTap: onSearchTap,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

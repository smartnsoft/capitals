import 'package:flappy_capitals/core/i18n.dart';
import 'package:flappy_capitals/ui/app_theme.dart';
import 'package:flappy_capitals/utils.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: Utils.isBigScreen(context)
          ? AppTheme.of(context).values.bigSearchWidth
          : AppTheme.of(context).values.smallSearchWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Image.asset(
              AppTheme.of(context).images.icSearch,
              height: 20,
              width: 20,
            ),
          ),
          Text(
            I18n.of(context).search_hint,
            style: AppTheme.of(context).textStyles.smallLightGreyText,
          )
        ],
      ),
    );
  }
}

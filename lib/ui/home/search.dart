import 'package:flappy_capitals/core/i18n.dart';
import 'package:flappy_capitals/ui/app_theme.dart';
import 'package:flappy_capitals/utils.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  final VoidCallback onTap;

  const Search({
    Key key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Utils.isBigScreen(context) ? 55 : 45,
      width: Utils.isBigScreen(context)
          ? AppTheme.of(context).values.bigSearchWidth
          : AppTheme.of(context).values.smallSearchWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Material(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius:  BorderRadius.circular(40),
        ),
        child: InkWell(
          onTap: onTap,
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
        ),
      ),
    );
  }
}

import 'package:flappy_capitals/ui/app_theme.dart';
import 'package:flappy_capitals/utils.dart';
import 'package:flutter/material.dart';

class ResponsiveButton extends StatelessWidget {
  final Widget icon;
  final Text text;
  final VoidCallback onTap;

  const ResponsiveButton({
    Key key,
    this.icon,
    this.text,
    this.onTap,
  }) : super(key: key);

  Widget _buildContent(BuildContext context) {
    if (Utils.isBigScreen(context)) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: icon,
          ),
          Expanded(
            child: Center(
              child: text,
            ),
          ),
        ],
      );
    }

    return Center(child: icon);
  }

  @override
  Widget build(BuildContext context) {
    final BorderRadius borderRadius = BorderRadius.circular(
      Utils.isBigScreen(context) ? 30 : 50,
    );
    return Container(
      height: 50,
      width: Utils.isBigScreen(context) ? 140 : 50,
      decoration: BoxDecoration(
        color: AppTheme.of(context).colors.primaryAccent,
        borderRadius: borderRadius,
      ),
      child: Material(
        borderRadius: borderRadius,
        clipBehavior: Clip.antiAlias,
        color: AppTheme.of(context).colors.primaryAccent,
        child: InkWell(
          borderRadius: borderRadius,
          splashColor: Colors.white,
          onTap: onTap,
          child: _buildContent(context),
        ),
      ),
    );
  }
}

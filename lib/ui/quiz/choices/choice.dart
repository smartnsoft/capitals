import 'package:flappy_capitals/ui/app_theme.dart';
import 'package:flutter/material.dart';

class Choice extends StatelessWidget {
  final String choice;
  final VoidCallback onTap;

  const Choice({
    Key key,
    @required this.choice,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 320,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        clipBehavior: Clip.antiAlias,
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onTap,
          child: Center(
            child: Text(
              choice,
              style: AppTheme.of(context).textStyles.bigLightBlackText,
            ),
          ),
        ),
      ),
    );
  }
}

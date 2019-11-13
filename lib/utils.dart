import 'package:flappy_capitals/ui/app_theme.dart';
import 'package:flutter/cupertino.dart';

class Utils {
  static bool isBigScreen(BuildContext context) =>
      MediaQuery.of(context).size.width > AppTheme.of(context).values.bigWebWidth;
}

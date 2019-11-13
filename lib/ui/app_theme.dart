import 'package:flutter/material.dart';

/// Colors
class _Colors {
  Color get primaryColor => Colors.pink[50];

  Color get black => Colors.black54;
}

/// Values
class _Values {}

/// Texts Styles
class _TextStyles {
  final _Colors colors;

  _TextStyles(this.colors);

  TextStyle get bigWebTitle => TextStyle(
        color: colors.black,
        fontSize: 35,
        fontWeight: FontWeight.bold,
      );
}

class AppTheme extends InheritedWidget {
  final _Colors colors = _Colors();
  final _Values values = _Values();

  _TextStyles textStyles;

  AppTheme({
    @required Widget child,
  }) : super(child: child) {
    textStyles = _TextStyles(colors);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  static AppTheme of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(AppTheme);
  }
}

import 'package:flutter/material.dart';

/// Colors
class _Colors {
  Color get primaryColor => Colors.pink[50];

  Color get black => Colors.black54;

  Color get pink => Color(0xfff5ceb8);
}

/// Values
class _Values {
  /// Home Cells width on big screen
  double get bigCellWidth => 320;

  /// Home Cells height on big screen
  double get bigCellHeight => 275;

  /// Home Cells spacing
  double get bigCellsSpacing => 20;

  /// Home Cells width on small screen
  double get smallCellWidth => 320;

  /// Home Cells width on small screen
  double get smallCellHeight => 120;

  /// Width required to be considered as a big web screen
  double get bigWebWidth => bigCellWidth * 3 + 2.5 * bigCellsSpacing;
}

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

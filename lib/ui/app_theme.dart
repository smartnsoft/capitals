import 'package:flutter/material.dart';

/// Colors
class _Colors {
  Color get primary => Color(0xfff5ceb8);

  Color get primaryAccent => Color(0xfff2bea1);

  Color get appBlack => Color(0xff212947);
}

/// Values
class _Values {
  /// Home cards overflow on Header
  double get cardsOverflow => 70;

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

  /// Big screen search width
  double get bigSearchWidth => 460;

  /// Small screen search width
  double get smallSearchWidth => 300;
}

/// Texts Styles
class _TextStyles {
  final _Colors colors;

  _TextStyles(this.colors);

  TextStyle get bigScreenTitle => TextStyle(
        color: colors.appBlack,
        fontSize: 40,
        fontWeight: FontWeight.w700,
        fontFamily: "ProxymaNova",
      );

  TextStyle get mediumWhiteLabel => TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontFamily: "ProxymaNova",
      );

  TextStyle get bigBlackText => TextStyle(
        color: colors.appBlack,
        fontSize: 28,
        fontWeight: FontWeight.w700,
        fontFamily: "ProxymaNova",
      );

  TextStyle get mediumBlackText => TextStyle(
        color: colors.appBlack,
        fontSize: 14,
        fontFamily: "ProxymaNova",
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

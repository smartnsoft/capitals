import 'package:flutter/material.dart';

/// Colors
class _Colors {
  Color get primary => Color(0xfff5ceb8);

  Color get primaryAccent => Color(0xfff2bea1);

  Color get appBlack => Color(0xff212947);

  Color get lightGrey => Color(0xffc6c6c7);
}

/// Values
class _Values {
  /// Home cards overflow on Header
  double get cardsOverflow => 70;

  /// Home Header height ratio
  double get headerHeightRatio => .45;

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

/// Images paths
class _Images {
  String get easy => "assets/images/easy.png";

  String get medium => "assets/images/medium.png";

  String get hard => "assets/images/hard.png";

  String get icSearch => "assets/images/ic_search.png";
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

  TextStyle get smallLightGreyText => TextStyle(
        color: colors.lightGrey,
        fontSize: 12,
        fontFamily: "ProxymaNova",
      );
}

class AppTheme extends InheritedWidget {
  final _Colors colors = _Colors();
  final _Values values = _Values();
  final _Images images = _Images();

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

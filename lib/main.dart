import 'package:flappy_capitals/core/i18n.dart';
import 'package:flappy_capitals/router.dart';
import 'package:flappy_capitals/ui/app_theme.dart';
import 'package:flappy_capitals/ui/home/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AppTheme(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          const I18nDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: I18nDelegate.supportedLocals,
        onGenerateRoute: Router.generateRoute,
        home: Home(),
      ),
    );
  }
}

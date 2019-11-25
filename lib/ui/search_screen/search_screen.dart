import 'package:flappy_capitals/ui/app_theme.dart';
import 'package:flappy_capitals/ui/home/search.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  static const String routeName = "/SearchScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.of(context).colors.primary,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: 100,
              child: Center(
                child: Search(),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}

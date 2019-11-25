import 'package:flappy_capitals/core/models/country.dart';
import 'package:flappy_capitals/ui/app_theme.dart';
import 'package:flutter/material.dart';

class CountryRow extends StatelessWidget {
  final Country country;

  const CountryRow({
    Key key,
    this.country,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                AppTheme.of(context).images.icCountryRow,
                height: 30,
                width: 20,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    country.name,
                    style: AppTheme.of(context).textStyles.mediumBoldBlackText,
                  ),
                  Text(
                    country.capital,
                    style: AppTheme.of(context).textStyles.mediumBoldBlackText.copyWith(fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

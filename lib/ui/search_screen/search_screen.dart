import 'package:flappy_capitals/core/blocs/search/bloc.dart';
import 'package:flappy_capitals/core/models/country.dart';
import 'package:flappy_capitals/ui/app_theme.dart';
import 'package:flappy_capitals/ui/search_screen/country_row.dart';
import 'package:flappy_capitals/ui/shared/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  static const String routeName = "/SearchScreen";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (BuildContext context) => SearchBloc(),
      child: Builder(
        builder: (BuildContext context) {
          return Scaffold(
            backgroundColor: AppTheme.of(context).colors.primary,
            body: SafeArea(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 100,
                    child: Center(
                      child: Search(
                        onChanged: (String newValue) {
                          BlocProvider.of<SearchBloc>(context).add(SearchByName(query: newValue));
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: BlocBuilder(
                        bloc: BlocProvider.of<SearchBloc>(context),
                        builder: (BuildContext context, SearchState state) {
                          if (state is SearchLoading) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is SearchResultSuccess) {
                            final List<Country> countries = state.countries;
                            return Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: ListView.builder(
                                itemCount: countries.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return CountryRow(
                                    country: countries[index],
                                  );
                                },
                              ),
                            );
                          } else if (state is SearchError) {
                            return Center(
                              child: Text("Error ${state.exception}"),
                            );
                          }

                          return Container();
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

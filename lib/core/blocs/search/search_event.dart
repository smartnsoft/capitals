import 'package:flappy_capitals/core/models/country.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SearchEvent {}

class SearchByName extends SearchEvent {
  final String query;

  SearchByName({
    this.query,
  });

  @override
  String toString() => "Search { query: $query }";
}

class FoundResults extends SearchEvent {
  final List<Country> countries;

  FoundResults({
    this.countries,
  });

  @override
  String toString() => "FoundResults { countries: $countries }";
}

class ClearSearch extends SearchEvent {
  @override
  String toString() => "ClearSearch";
}

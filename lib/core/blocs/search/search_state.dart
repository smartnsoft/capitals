import 'package:flappy_capitals/core/models/country.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SearchState {}

class InitialSearchState extends SearchState {}

class SearchLoading extends SearchState {
  @override
  String toString() => "SearchLoading";
}

class SearchResultSuccess extends SearchState {
  final List<Country> countries;

  SearchResultSuccess({
    this.countries,
  });

  @override
  String toString() => "SearchResultSuccess { countries: $countries }";
}

class SearchError extends SearchState {
  final Exception exception;

  SearchError({
    this.exception,
  });

  @override
  String toString() => "SearchError { exception: $SearchError }";
}

class SearchCleared extends SearchState {
  @override
  String toString() => "SearchCleared";
}
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flappy_capitals/core/models/country.dart';
import 'package:flappy_capitals/core/services/api.dart';

import './bloc.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  Timer _debounce;

  @override
  Future<void> close() {
    _debounce.cancel();
    return super.close();
  }

  @override
  SearchState get initialState => InitialSearchState();

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is SearchByName) {
      yield SearchLoading();
      try {
        if (_debounce?.isActive ?? false) {
          _debounce.cancel();
        }

        _debounce = Timer(Duration(milliseconds: 500), () async {
          final List<Country> countries = await Api.searchCountries(query: event.query);
          add(FoundResults(countries: countries));
        });
      } catch (error) {
        yield SearchError(exception: error);
      }
    }

    if (event is FoundResults) {
      yield SearchResultSuccess(countries: event.countries);
    }

    if (event is ClearSearch) {
      yield SearchCleared();
    }
  }
}

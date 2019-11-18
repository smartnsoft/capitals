import 'dart:collection';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flappy_capitals/core/models/country.dart';
import 'package:flappy_capitals/core/models/exceptions/exceptions.dart';
import 'package:flappy_capitals/core/models/question.dart';

class Api {
  static const String _BASE_URL = "https://restcountries.eu/rest/v2";

  static Future<List<Question>> getQuestions({
    int nbQuestions = 20,
    int nbAnswer = 2,
  }) async {
    try {
      final Response response = await Dio().get("$_BASE_URL/all?fields=name;capital;");

      final List<Country> countries = (response.data as List).map((element) => Country.fromJson(element)).toList();
      final List<String> capitals =
          countries.map((country) => country.capital).toList().where((cap) => cap.isNotEmpty).toList();

      countries.shuffle();
      capitals.shuffle();

      final Queue<Country> countriesQueue = Queue();

      countriesQueue.addAll(countries.where((country) => country.capital.isNotEmpty));

      final List<Question> questions = [];

      for (int index = 0; index < nbQuestions; index++) {
        final Country country = countriesQueue.removeFirst();
        final List<String> generatedPossibilities = [country.capital];

        int answersIndex = 0;
        while (answersIndex < nbAnswer - 1) {
          final String capital = capitals[Random().nextInt(capitals.length - 1)];
          if (!generatedPossibilities.contains(capital)) {
            generatedPossibilities.add(capital);
            answersIndex++;
          }
        }

        generatedPossibilities.shuffle();

        questions.add(
          Question(
            countryName: country.name,
            answer: country.capital,
            choices: generatedPossibilities,
          ),
        );
      }

      return questions;
    } on DioError catch (error) {
      if (error.message.contains(NetworkException.DIO_NETWORK_EXCEPTION_MESSAGE))
        throw NetworkException();
      else
        throw ServerException(statusCode: error.response.statusCode);
    }
  }
}

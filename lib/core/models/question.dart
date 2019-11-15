class Question {
  final String countryName;
  final String answer;
  final List<String> choices;

  Question({
    this.countryName,
    this.answer,
    this.choices,
  });

  @override
  String toString() => "Question { countryName: $countryName, response: $answer, possibilities: $choices }";
}

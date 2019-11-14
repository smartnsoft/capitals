class Question {
  final String countryName;
  final String response;
  final List<String> possibilities;

  Question({
    this.countryName,
    this.response,
    this.possibilities,
  });

  @override
  String toString() => "Question { countryName: $countryName, response: $response, possibilities: $possibilities }";
}

class Score {
  final int points;
  final int maxPoints;

  Score({
    this.points,
    this.maxPoints,
  });

  @override
  String toString() => "Result { points: $points, maxPoints: $maxPoints }";
}

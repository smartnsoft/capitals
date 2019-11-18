import 'package:meta/meta.dart';

@immutable
abstract class ProgressState {}

class TimerProgressed extends ProgressState {
  final double progressionInMilliseconds;
  final int maxDurationInMilliseconds;

  TimerProgressed({
    this.progressionInMilliseconds = 0,
    this.maxDurationInMilliseconds = 100,
  });

  @override
  String toString() =>
      "TimerProgressed { progressionInMilliseconds: $progressionInMilliseconds, maxDurationInMilliseconds: $maxDurationInMilliseconds }";
}

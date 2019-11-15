import 'package:meta/meta.dart';

@immutable
abstract class ProgressState {}

class TimerProgressed extends ProgressState {
  final int progressionInSeconds;
  final int maxDurationInSeconds;

  TimerProgressed({
    this.progressionInSeconds = 0,
    this.maxDurationInSeconds = 0,
  });

  @override
  String toString() =>
      "TimerProgressed { progressionInSeconds: $progressionInSeconds, maxDurationInSeconds: $maxDurationInSeconds }";
}

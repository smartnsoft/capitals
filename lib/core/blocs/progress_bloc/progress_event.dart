import 'package:meta/meta.dart';

@immutable
abstract class ProgressEvent {}

class StartTimer extends ProgressEvent {
  final int maxDurationInSeconds;

  StartTimer({
    @required this.maxDurationInSeconds,
  });

  @override
  String toString() => "StartTimer { maxDurationInSeconds: $maxDurationInSeconds }";
}

class NotifyProgress extends ProgressEvent {
  @override
  String toString() => "NotifyProgress";
}

class StopTimer extends ProgressEvent {
  @override
  String toString() => "StopTimer";
}

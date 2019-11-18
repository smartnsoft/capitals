import 'package:meta/meta.dart';

@immutable
abstract class ProgressEvent {}

class StartTimer extends ProgressEvent {
  final int maxDurationInMilliseconds;

  StartTimer({
    @required this.maxDurationInMilliseconds,
  });

  @override
  String toString() => "StartTimer { maxDurationInMilliseconds: $maxDurationInMilliseconds }";
}

class NotifyProgress extends ProgressEvent {
  @override
  String toString() => "NotifyProgress";
}

class StopTimer extends ProgressEvent {
  @override
  String toString() => "StopTimer";
}

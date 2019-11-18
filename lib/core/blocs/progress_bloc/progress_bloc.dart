import 'dart:async';

import 'package:bloc/bloc.dart';

import './bloc.dart';

class ProgressBloc extends Bloc<ProgressEvent, ProgressState> {
  Timer _timer;
  double _currentProgressionInMilliseconds = 0;
  int _maxDurationInMilliseconds = 0;
  static const int INCREMENTED_TIME_IN_MS = 100;

  @override
  ProgressState get initialState => TimerProgressed(progressionInMilliseconds: _currentProgressionInMilliseconds);

  @override
  Stream<ProgressState> mapEventToState(
    ProgressEvent event,
  ) async* {
    if (event is StartTimer) {
      if (_timer != null) {
        if (_timer.isActive) {
          _timer.cancel();
        }

        _resetTimer();
        _timer = null;
        yield ClearProgress();
      }

      _maxDurationInMilliseconds = event.maxDurationInMilliseconds;
      _timer = Timer.periodic(Duration(milliseconds: INCREMENTED_TIME_IN_MS), _onTimerTick);
    }

    if (event is NotifyProgress) {
      yield TimerProgressed(
        progressionInMilliseconds: _currentProgressionInMilliseconds,
        maxDurationInMilliseconds: _maxDurationInMilliseconds,
      );
    }

    if (event is StopTimer) {
      _timer.cancel();
    }
  }

  @override
  Future<void> close() {
    _timer.cancel();
    _timer = null;
    return super.close();
  }

  _resetTimer() {
    _currentProgressionInMilliseconds = 0;
    _maxDurationInMilliseconds = 1000;
  }

  _onTimerTick(Timer timer) {
    if (timer.isActive) {
      if (_currentProgressionInMilliseconds >= _maxDurationInMilliseconds) {
        add(StopTimer());
      } else {
        _currentProgressionInMilliseconds += INCREMENTED_TIME_IN_MS;
        add(NotifyProgress());
      }
    }
  }
}

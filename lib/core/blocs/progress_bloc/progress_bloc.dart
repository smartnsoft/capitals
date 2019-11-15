import 'dart:async';

import 'package:bloc/bloc.dart';

import './bloc.dart';

class ProgressBloc extends Bloc<ProgressEvent, ProgressState> {
  Timer _timer;
  int _currentProgressionInSeconds = 0;
  int _maxDurationInSeconds = 0;

  @override
  ProgressState get initialState => TimerProgressed(progressionInSeconds: _currentProgressionInSeconds);

  @override
  Stream<ProgressState> mapEventToState(
    ProgressEvent event,
  ) async* {
    if (event is StartTimer) {
      if (_timer != null) {
        _timer.cancel();
        _timer = null;
      }

      _maxDurationInSeconds = event.maxDurationInSeconds;
      _timer = Timer.periodic(Duration(seconds: 1), _onTimerTick);
    }

    if (event is NotifyProgress) {
      yield TimerProgressed(
        progressionInSeconds: _currentProgressionInSeconds,
        maxDurationInSeconds: _maxDurationInSeconds,
      );
    }

    if (event is StopTimer) {
      _timer.cancel();
    }
  }

  _onTimerTick(Timer timer) {
    if (_currentProgressionInSeconds >= _maxDurationInSeconds) {
      add(StopTimer());
    } else {
      _currentProgressionInSeconds += 1;
      add(NotifyProgress());
    }
  }
}

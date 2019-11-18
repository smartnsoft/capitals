import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flappy_capitals/core/blocs/progress_bloc/bloc.dart';
import 'package:flappy_capitals/core/models/question.dart';
import 'package:flappy_capitals/core/models/quiz_type.dart';
import 'package:flappy_capitals/core/services/api.dart';
import 'package:flutter/cupertino.dart';

import './bloc.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final ProgressBloc progressBloc;
  final List<Question> _questions = [];
  int _currentQuestionIndex = -1;

  QuizBloc({
    @required this.progressBloc,
  });

  @override
  QuizState get initialState => InitialQuizState();

  @override
  Stream<QuizState> mapEventToState(
    QuizEvent event,
  ) async* {
    if (event is StartQuiz) {
      yield QuizLoading();

      try {
        final QuizType quizType = event.quizType;
        final List<Question> questions = await Api.getQuestions(
          nbQuestions: _nbQuestionsByQuizType(quizType),
          nbAnswer: _nbAnswersByQuizType(quizType),
        );

        _questions.clear();
        _questions.addAll(questions);

        add(ShowNewQuestion());
      } catch (error) {
        yield QuizLoadingError(error);
      }
    }

    if (event is ShowNewQuestion) {
      _currentQuestionIndex++;
      yield NewQuestion(question: _questions[_currentQuestionIndex]);
      progressBloc.add(
        StartTimer(
          maxDurationInMilliseconds: Duration(seconds: 4).inMilliseconds,
        ),
      );
      progressBloc.listen(_onProgressBlocChange);
    }

    if (event is SelectChoice) {
      progressBloc.add(StopTimer());
      yield ShowAnswer(question: _questions[_currentQuestionIndex]);
      await Future.delayed(Duration(seconds: 1));
      add(ShowNewQuestion());
    }

    if (event is OutOfTime) {
      yield ShowAnswer(question: _questions[_currentQuestionIndex]);
    }
  }

  _onProgressBlocChange(ProgressState progressState) {
    if (progressState is TimerProgressed) {
      if (progressState.progressionInMilliseconds >= progressState.maxDurationInMilliseconds) {
        add(OutOfTime());
      }
    }
  }

  int _nbQuestionsByQuizType(QuizType quizType) {
    return 20;
  }

  int _nbAnswersByQuizType(QuizType quizType) {
    switch (quizType) {
      case QuizType.easy:
        return 2;
        break;
      case QuizType.medium:
        return 4;
      default:
        return 0;
        break;
    }
  }
}

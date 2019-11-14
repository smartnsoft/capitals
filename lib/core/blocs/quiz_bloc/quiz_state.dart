import 'package:flappy_capitals/core/models/question.dart';
import 'package:meta/meta.dart';

@immutable
abstract class QuizState {}

class InitialQuizState extends QuizState {}

class QuizLoading extends QuizState {
  @override
  String toString() => "QuizLoading";
}

class QuizLoadingError extends QuizState {
  final Exception exception;

  QuizLoadingError(
    this.exception,
  );

  @override
  String toString() => "QuizLoadingError { exception: $exception }";
}

class NewQuestion extends QuizState {
  final Question question;

  NewQuestion({
    this.question,
  });

  @override
  String toString() => "NewQuestion { question: $question }";
}

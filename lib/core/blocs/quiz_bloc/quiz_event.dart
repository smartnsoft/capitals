import 'package:flappy_capitals/core/models/quiz_type.dart';
import 'package:meta/meta.dart';

@immutable
abstract class QuizEvent {}

class StartQuiz extends QuizEvent {
  final QuizType quizType;

  StartQuiz({
    this.quizType = QuizType.easy,
  });

  @override
  String toString() => "StartQuiz { quizType: $quizType }";
}

class SelectChoice extends QuizEvent {
  final String choice;

  SelectChoice({
    this.choice,
  });

  @override
  String toString() => "SelectChoice { choice: $choice }";
}

class ShowNewQuestion extends QuizEvent {
  @override
  String toString() => "ShowNewQuestion";
}

class OutOfTime extends QuizEvent {
  @override
  String toString() => "OutOfTime";
}

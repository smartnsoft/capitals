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

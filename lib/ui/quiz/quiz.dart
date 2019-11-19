import 'package:flappy_capitals/core/blocs/progress_bloc/bloc.dart';
import 'package:flappy_capitals/core/blocs/quiz_bloc/bloc.dart';
import 'package:flappy_capitals/core/i18n.dart';
import 'package:flappy_capitals/core/models/question.dart';
import 'package:flappy_capitals/core/models/quiz_type.dart';
import 'package:flappy_capitals/core/models/score.dart';
import 'package:flappy_capitals/ui/app_theme.dart';
import 'package:flappy_capitals/ui/quiz/choices/choices.dart';
import 'package:flappy_capitals/ui/quiz/progress/progress_container/quiz_progress_container.dart';
import 'package:flappy_capitals/ui/quiz/question_widget.dart';
import 'package:flappy_capitals/ui/quiz/result/result.dart';
import 'package:flappy_capitals/ui/shared/responsive_button.dart';
import 'package:flappy_capitals/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuizScreen extends StatelessWidget {
  static const String routeName = "Quiz";
  final QuizType quizType;

  const QuizScreen({
    Key key,
    this.quizType = QuizType.easy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProgressBloc progressBloc = ProgressBloc();
    return BlocProvider(
      builder: (BuildContext context) => progressBloc,
      child: BlocProvider<QuizBloc>(
        builder: (BuildContext context) => QuizBloc(progressBloc: progressBloc)..add(StartQuiz(quizType: quizType)),
        child: Scaffold(
          backgroundColor: AppTheme.of(context).colors.primary,
          body: Quiz(),
        ),
      ),
    );
  }
}

class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Utils.makeStatusBarTransparent();
        return Future(() => true);
      },
      child: BlocListener(
        bloc: BlocProvider.of<QuizBloc>(context),
        listener: (BuildContext context, QuizState state) {
          if (state is ShowScore) {
            _goToResult(context, Score(points: state.score, maxPoints: state.max));
          }
        },
        child: QuizProgressContainer(
          child: Padding(
            padding: EdgeInsets.all(
              AppTheme.of(context).values.progressContainerBorderSize +
                  AppTheme.of(context).values.paddingInsideProgressContainer,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ResponsiveButton(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  icon: Image.asset(
                    AppTheme.of(context).images.icClose,
                    height: 20,
                    width: 20,
                  ),
                  text: Text(
                    I18n.of(context).close,
                    style: AppTheme.of(context).textStyles.mediumWhiteLabel,
                  ),
                ),
                Expanded(
                  child: BlocBuilder(
                    bloc: BlocProvider.of<QuizBloc>(context),
                    builder: (BuildContext context, QuizState state) {
                      if (state is QuizLoading) {
                        return Center(
                          child: CircularProgressIndicator(
                            valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        );
                      } else if (state is NewQuestion) {
                        final Question question = state.question;
                        return _buildQuestion(context, question);
                      } else if (state is ShowAnswer) {
                        final Question question = state.question;
                        return _buildQuestion(context, question, showAnswer: true);
                      }

                      return Container();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _goToResult(BuildContext context, Score score) {
    Navigator.of(context).pushReplacementNamed(ResultScreen.routeName, arguments: score);
  }

  Widget _buildQuestion(BuildContext context, Question question, {bool showAnswer = false}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          mainAxisAlignment: Utils.isBigScreen(context) ? MainAxisAlignment.center : MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Utils.isBigScreen(context) ? Container() : Spacer(),
            _getCenteredWidget(context, question.countryName),
            SizedBox(
              height: 25,
            ),
            Choices(
              question: question,
              showAnswer: showAnswer,
            ),
          ],
        ),
      ),
    );
  }

  Widget _getCenteredWidget(BuildContext context, String countryName) {
    if (Utils.isBigScreen(context)) {
      return Container(
        child: QuestionWidget(
          countryName: countryName,
        ),
      );
    }

    return Expanded(
      flex: 2,
      child: QuestionWidget(
        countryName: countryName,
      ),
    );
  }
}

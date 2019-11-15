import 'package:flappy_capitals/core/blocs/progress_bloc/bloc.dart';
import 'package:flappy_capitals/core/blocs/quiz_bloc/bloc.dart';
import 'package:flappy_capitals/core/i18n.dart';
import 'package:flappy_capitals/core/models/question.dart';
import 'package:flappy_capitals/core/models/quiz_type.dart';
import 'package:flappy_capitals/ui/app_theme.dart';
import 'package:flappy_capitals/ui/quiz/choices/choices.dart';
import 'package:flappy_capitals/ui/quiz/progress/quiz_progress_container.dart';
import 'package:flappy_capitals/ui/quiz/question_widget.dart';
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
        builder: (BuildContext context) => QuizBloc(progressBloc: progressBloc)..add(StartQuiz()),
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
    return SafeArea(
      child: QuizProgressContainer(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
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
                      return Center(
                        child: Column(
                          mainAxisAlignment:
                              Utils.isBigScreen(context) ? MainAxisAlignment.center : MainAxisAlignment.start,
                          children: <Widget>[
                            Utils.isBigScreen(context) ? Container() : Spacer(),
                            _getCenteredWidget(context, question.countryName),
                            SizedBox(
                              height: 25,
                            ),
                            Choices(
                              choices: question.possibilities,
                            ),
                          ],
                        ),
                      );
                    }

                    return Container();
                  },
                ),
              ),
            ],
          ),
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
      child: QuestionWidget(
        countryName: countryName,
      ),
    );
  }
}

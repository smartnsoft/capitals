import 'package:flappy_capitals/core/blocs/quiz_bloc/bloc.dart';
import 'package:flappy_capitals/core/i18n.dart';
import 'package:flappy_capitals/core/models/quiz_type.dart';
import 'package:flappy_capitals/ui/app_theme.dart';
import 'package:flappy_capitals/ui/quiz/quiz_progress_container.dart';
import 'package:flappy_capitals/ui/shared/responsive_button.dart';
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
    return BlocProvider<QuizBloc>(
      builder: (BuildContext context) => QuizBloc()..add(StartQuiz()),
      child: Scaffold(
        backgroundColor: AppTheme.of(context).colors.primary,
        body: Quiz(),
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
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ResponsiveButton(
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
                      return Center(
                        child: Text(state.question.countryName),
                      );
                    }

                    return Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[Text("ok")],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

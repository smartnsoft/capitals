import 'package:flappy_capitals/core/blocs/quiz_bloc/bloc.dart';
import 'package:flappy_capitals/core/models/question.dart';
import 'package:flappy_capitals/ui/quiz/choices/choice.dart';
import 'package:flappy_capitals/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Choices extends StatelessWidget {
  final Question question;
  final bool showAnswer;

  const Choices({
    Key key,
    this.question,
    this.showAnswer = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> choices = question.choices;
    if (choices.isEmpty) return Container();

    final List<Choice> choicesWidgets = choices.map((choice) {
      return Choice(
        choice: choice,
        onTap: () => _onChoiceSelect(context, choice),
        showAnswer: showAnswer,
        isAnswer: choice == question.answer,
        choiceCellType: choices.length <= 2 ? ChoiceCellType.normal : ChoiceCellType.small,
      );
    }).toList();
    if (choices.length <= 2) {
      return _buildEasyChoices(context, choicesWidgets);
    } else {
      return _buildMediumChoices(context, choicesWidgets);
    }
  }

  _onChoiceSelect(BuildContext context, String choice) {
    BlocProvider.of<QuizBloc>(context).add(SelectChoice(choice: choice));
  }

  Widget _buildEasyChoices(BuildContext context, List<Choice> choicesWidgets) {
    if (Utils.isBigScreen(context)) {
      return Wrap(
        spacing: 15,
        children: choicesWidgets,
      );
    }

    return Wrap(
      spacing: 15,
      alignment: WrapAlignment.center,
      direction: Axis.vertical,
      children: choicesWidgets,
    );
  }

  Widget _buildMediumChoices(BuildContext context, List<Choice> choicesWidgets) {
    return Wrap(
      spacing: 15,
      alignment: WrapAlignment.center,
      direction: Axis.vertical,
      children: [
        _buildMediumLine(context, choicesWidgets.sublist(0, 2)),
        _buildMediumLine(context, choicesWidgets.sublist(2, 4)),
      ],
    );
  }

  Widget _buildMediumLine(BuildContext context, List<Choice> subList) {
    return Wrap(
      spacing: 15,
      children: subList,
    );
  }
}
